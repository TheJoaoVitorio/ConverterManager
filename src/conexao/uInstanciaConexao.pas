unit uInstanciaConexao;



interface

uses
  uConexao, System.SysUtils, FireDAC.Stan.Def;

type
  TInstanciaConexaoController = class
  private
    FConexao     : TConexao;


    class var FInstance: TInstanciaConexaoController;
    class procedure ReleaseInstance; static;

  public
    constructor Create();
    destructor Destroy; override;



    class function GetInstance: TInstanciaConexaoController;

     property Conexao: TConexao read FConexao write FConexao;

  end;

implementation

{ TSistemaControl }


constructor TInstanciaConexaoController.Create();
begin
  FConexao     := TConexao.Create;

end;


destructor TInstanciaConexaoController.Destroy;
begin

  FConexao.Free;

  inherited;
end;


class function TInstanciaConexaoController.GetInstance: TInstanciaConexaoController;
begin
  if not Assigned(Self.FInstance) then
  begin
    Self.FInstance := TInstanciaConexaoController.Create();
  end;

  Result := Self.FInstance;
end;



class procedure TInstanciaConexaoController.ReleaseInstance;
begin
      if FInstance <> nil then
        begin
          FInstance.Free;
          FInstance := nil;
        end;
end;

initialization

finalization
  TInstanciaConexaoController.ReleaseInstance;


end.
