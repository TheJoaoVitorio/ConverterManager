unit uGerenciadorController;

interface

uses
  FireDAC.VCLUI.Wait,
  uInstanciaConexao, uSistemasVO, System.Generics.Collections,
  FireDAC.Comp.Client;

type
  TGerenciadorController = class
    private
    public
      class function GetSistemas : TObjectList<TSistemasVO>;
  end;

implementation

{ TGerenciadorController }

class function TGerenciadorController.GetSistemas: TObjectList<TSistemasVO>;
var vQuery : TFDQuery;
    vSistema : TSistemasVO;
begin

    Result := TObjectList<TSistemasVO>.Create;

    vQuery := TFDQuery.Create(nil);
    try
      try
        with vQuery do
        begin
            Connection := TInstanciaConexaoController.GetInstance().Conexao.GetConexao;
            SQL.Text   := 'SELECT * FROM SISTEMAS';

            Open;

            while not Eof do
            begin
                vSistema := TSistemasVO.Create;
                vSistema.ID       := vQuery.FieldByName('ID').AsInteger;
                vSistema.Sistema  := vQuery.FieldByName('SISTEMA').AsString;
                vSistema.Cidade   := vQuery.FieldByName('CIDADE').AsString+ ' - ' +vQuery.FieldByName('ESTADO').AsString;
                vSistema.Versao   := vQuery.FieldByName('VERSAO').AsString;
                vSistema.TipoBase := vQuery.FieldByName('TIPO_BASE').AsString;
                vSistema.Usuario  := vQuery.FieldByName('USUARIO').AsString;
                vSistema.Senha    := vQuery.FieldByName('SENHA').AsString;
                vSistema.NomeBase := vQuery.FieldByName('NOME_BASE').AsString;

                Result.Add(vSistema);

            Next;
            end;
        end;
      except
      end;

    finally
      if Assigned(vQuery) then vQuery.Free;
    end;


end;

end.