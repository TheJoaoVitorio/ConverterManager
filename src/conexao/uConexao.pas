unit uConexao;

interface

uses
  Inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FB, System.SysUtils, FireDAC.DApt;

type
  TConexao = class
    private
        Conexao    : TFDConnection;
        Query      : TFDQuery;
    public
        procedure AfterConstruction ; override;
        procedure BeforeDestruction ; override;
        procedure ConfiguraConexao;

        function GetConexao: TFDConnection;
        function QueryConexao: TFDQuery;

  end;

var
  pHostConexao : TConexao;

implementation


//uses
  //uConfiguracaoController;

{ THostConexao }

procedure TConexao.AfterConstruction;
begin

      inherited;

      if not Assigned(Conexao) then
        begin
            Conexao    := TFDConnection.Create(nil);

            ConfiguraConexao;
        end;

      if not Assigned(Query) then
        Query := TFDQuery.Create(nil);

end;

procedure TConexao.BeforeDestruction;
begin

    inherited;
    if Assigned(Query) then
      FreeAndNil(Query);


    if Assigned(Conexao) then
      FreeAndNil(Conexao);


end;

procedure TConexao.ConfiguraConexao;
var
    Ini : TIniFile;
begin
        Ini := nil;

        try

              if FileExists(ExtractFilePath(ParamStr(0)) + '\data\Conexao.ini' ) then
                begin
                      Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\data\Conexao.ini');

                      with Conexao do
                        begin
                            Params.UserName           := Ini.ReadString('CONEXAO_MANAGER','Username','');
                            Params.Password           := Ini.ReadString('CONEXAO_MANAGER','Password','');
                            Params.DriverID           := Ini.ReadString('CONEXAO_MANAGER','DriverID','');
                            Params.Database           := Ini.ReadString('CONEXAO_MANAGER','Database','');
                            Params.Values['Port']     := Ini.ReadString('CONEXAO_MANAGER','Port','');

                            Connected := True;
                        end;
                end;
        finally
            Ini.Free;
        end;


end;

function TConexao.GetConexao: TFDConnection;
begin

    Result := Conexao;

end;

function TConexao.QueryConexao: TFDQuery;
begin

    Query.Connection := Conexao;

    Result := Query;
end;

end.
