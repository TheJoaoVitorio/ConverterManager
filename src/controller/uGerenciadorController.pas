unit uGerenciadorController;

interface

uses
  FireDAC.VCLUI.Wait,Data.DB,Datasnap.DBClient,
  uInstanciaConexao, uSistemasVO, System.Generics.Collections,
  FireDAC.Comp.Client;

type
  TGerenciadorController = class
    private


    public
      class function UpdateSistema(listSistema : TObjectList<TSistemasVO>): Boolean;
      class function InsertSistema(listSistema: TObjectList<TSistemasVO>): Boolean;
      class function GetSistemas : TObjectList<TSistemasVO>;
      class function GetSistema(Id : Integer) : TObjectList<TSistemasVO>;

      class function GetSistemaPesquisa(Nome : String ) : TObjectList<TSistemasVO>;

      class function DeleteSistema(Id: Integer): Boolean;
  end;

implementation

uses
  System.SysUtils;

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
            SQL.Text   := 'SELECT * FROM SISTEMAS order by SISTEMA asc';

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



class function TGerenciadorController.GetSistema(Id: Integer): TObjectList<TSistemasVO>;
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
            SQL.Text   := 'SELECT * '+
                          'FROM SISTEMAS '+
                          'WHERE ID = :ID';
            ParamByName('ID').AsInteger := Id;

            Open;

            while not Eof do
            begin
                vSistema := TSistemasVO.Create;
                vSistema.ID                   := vQuery.FieldByName('ID').AsInteger;
                vSistema.Sistema              := vQuery.FieldByName('SISTEMA').AsString;
                vSistema.Cidade               := vQuery.FieldByName('CIDADE').AsString;
                vSistema.Estado               := vQuery.FieldByName('ESTADO').AsString;
                vSistema.Versao               := vQuery.FieldByName('VERSAO').AsString;
                vSistema.DataCriacao          := vQuery.FieldByName('DATA_CRIACAO').AsDateTime;
                vSistema.DataAlteracao        := vQuery.FieldByName('DATA_ALTERACAO').AsDateTime;
                vSistema.TipoBase             := vQuery.FieldByName('TIPO_BASE').AsString;
                vSistema.Usuario              := vQuery.FieldByName('USUARIO').AsString;
                vSistema.Senha                := vQuery.FieldByName('SENHA').AsString;
                vSistema.Porta                := vQuery.FieldByName('PORTA').AsInteger;
                vSistema.Driver               := vQuery.FieldByName('DRIVER').AsString;
                vSistema.NomeBase             := vQuery.FieldByName('NOME_BASE').AsString;
                vSistema.CaminhoBase          := vQuery.FieldByName('CAMINHO_BASE').AsString;
                vSistema.Servidor             := vQuery.FieldByName('SERVIDOR').AsString;
                vSistema.Observacoes          := vQuery.FieldByName('OBSERVACOES').AsString;
                vSistema.VersaoConversor      := vQuery.FieldByName('VERSAO_CONVERSOR').AsString;

                vSistema.Produtos             := vQuery.FieldByName('PRODUTOS').AsInteger;               //1
                vSistema.ContasReceber        := vQuery.FieldByName('CONTAS_RECEBER').AsInteger;
                vSistema.ContasPagar          := vQuery.FieldByName('CONTAS_PAGAR').AsInteger;
                vSistema.Fornecedores         := vQuery.FieldByName('FORNECEDORES').AsInteger;
                vSistema.Clientes             := vQuery.FieldByName('CLIENTES').AsInteger;              //5

                vSistema.ICMSPadraoEstado     := vQuery.FieldByName('ICMS_PADRAO_ESTADO').AsInteger;
                vSistema.Modulos              := vQuery.FieldByName('MODULOS').AsString;
                vSistema.PathImg              := vQuery.FieldByName('PATH_IMG').AsString;

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



class function TGerenciadorController.GetSistemaPesquisa(Nome : String ) : TObjectList<TSistemasVO>;
var
  vQuery : TFDQuery;
  vSistema : TSistemasVO;
begin
    Result := TObjectList<TSistemasVO>.Create;

    vQuery := TFDQuery.Create(nil);
    try
      try
        with vQuery do
        begin
          Connection := TInstanciaConexaoController.GetInstance().Conexao.GetConexao;
          SQL.Add('SELECT * FROM SISTEMAS ');

          if Nome <> '' then
          begin
            SQL.Add('WHERE (UPPER(SISTEMA) LIKE :TextoPesquisa) ' +
                    'OR (UPPER(TIPO_BASE) LIKE :TextoPesquisa) ');

            ParamByName('TextoPesquisa').AsString := '%' + UpperCase(Nome) + '%';
          end;

          SQL.Add('order by SISTEMA asc');

          Open;

          if not IsEmpty then
          begin
            while not Eof do begin
            vSistema          := TSistemasVO.Create;

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

        end;

      except
        on E: Exception do
          raise Exception.Create('Error: ' + E.Message );
      end;
    finally
      if Assigned(vQuery) then vQuery.Free;      
    end;

end;



class function TGerenciadorController.InsertSistema(listSistema: TObjectList<TSistemasVO>) : Boolean;
var vQuery : TFDQuery;
    item: TSistemasVO;

begin


    vQuery := TFDQuery.Create(nil);
    try
      try
        with vQuery do
        begin
           Connection := TInstanciaConexaoController.GetInstance().Conexao.GetConexao;
           SQL.Text := 'INSERT INTO Sistemas (' +
                      '     SISTEMA, CIDADE, ESTADO, VERSAO, DATA_CRIACAO, DATA_ALTERACAO, TIPO_BASE, ' +
                      '    USUARIO, SENHA, PORTA, DRIVER, NOME_BASE, CAMINHO_BASE, SERVIDOR, OBSERVACOES, ' +
                      '    VERSAO_CONVERSOR, PRODUTOS, CONTAS_RECEBER, CONTAS_PAGAR, FORNECEDORES, ' +
                      '    CLIENTES, ICMS_PADRAO_ESTADO, MODULOS, PATH_IMG' +
                      ') VALUES (' +
                      '     :SISTEMA, :CIDADE, :ESTADO, :VERSAO, :DATA_CRIACAO, :DATA_ALTERACAO, :TIPO_BASE, ' +
                      '    :USUARIO, :SENHA, :PORTA, :DRIVER, :NOME_BASE, :CAMINHO_BASE, :SERVIDOR, :OBSERVACOES, ' +
                      '    :VERSAO_CONVERSOR, :PRODUTOS, :CONTAS_RECEBER, :CONTAS_PAGAR, :FORNECEDORES, ' +
                      '    :CLIENTES, :ICMS_PADRAO_ESTADO, :MODULOS, :PATH_IMG' +
                      ');';



           for item in listSistema do
            begin
              //ParamByName('ID').AsInteger                 := item.ID;
              ParamByName('SISTEMA').AsString             := item.Sistema;
              ParamByName('CIDADE').AsString              := item.Cidade;
              ParamByName('ESTADO').AsString              := item.Estado;
              ParamByName('VERSAO').AsString              := item.Versao;
              ParamByName('DATA_CRIACAO').AsDateTime      := Date;
              ParamByName('DATA_ALTERACAO').AsDateTime    := Date;
              ParamByName('TIPO_BASE').AsString           := item.TipoBase;
              ParamByName('USUARIO').AsString             := item.Usuario;
              ParamByName('SENHA').AsString               := item.Senha;
              ParamByName('PORTA').AsInteger              := item.Porta;
              ParamByName('DRIVER').AsString              := item.Driver;
              ParamByName('NOME_BASE').AsString           := item.NomeBase;
              ParamByName('CAMINHO_BASE').AsString        := item.CaminhoBase;
              ParamByName('SERVIDOR').AsString            := item.Servidor;
              ParamByName('OBSERVACOES').AsString         := item.Observacoes;
              ParamByName('VERSAO_CONVERSOR').AsString    := item.VersaoConversor;

              ParamByName('PRODUTOS').AsInteger           := item.Produtos;
              ParamByName('CONTAS_RECEBER').AsInteger     := item.ContasReceber;
              ParamByName('CONTAS_PAGAR').AsInteger       := item.ContasPagar;
              ParamByName('FORNECEDORES').AsInteger       := item.Fornecedores;
              ParamByName('CLIENTES').AsInteger           := item.Clientes;

              ParamByName('ICMS_PADRAO_ESTADO').AsInteger := item.ICMSPadraoEstado;
              ParamByName('MODULOS').AsString             := item.Modulos;
              ParamByName('PATH_IMG').AsString            := item.PathImg;

            end;

            ExecSQL;

            Result := True;
        end;
      except
        Result := False;
      end;
    finally
      if Assigned(vQuery) then vQuery.Free;
    end;


end;



class function TGerenciadorController.UpdateSistema(listSistema : TObjectList<TSistemasVO>) : Boolean;
var vQuery : TFDQuery;
    item: TSistemasVO;
begin


    vQuery := TFDQuery.Create(nil);
    try
      try
        with vQuery do
        begin
          Connection := TInstanciaConexaoController.GetInstance().Conexao.GetConexao;
          SQL.Text := 'UPDATE Sistemas '+
                     'SET '+
                     '     SISTEMA = :SISTEMA, '+
                     '     CIDADE = :CIDADE, '+
                     '     ESTADO = :ESTADO, '+
                     '     VERSAO = :VERSAO, '+
                     '     DATA_CRIACAO = :DATA_CRIACAO, '+
                     '     DATA_ALTERACAO = :DATA_ALTERACAO, '+
                     '     TIPO_BASE = :TIPO_BASE, '+
                     '     USUARIO = :USUARIO, '+
                     '     SENHA = :SENHA, '+
                     '     PORTA = :PORTA, '+
                     '     DRIVER = :DRIVER, '+
                     '     NOME_BASE = :NOME_BASE, '+
                     '     CAMINHO_BASE = :CAMINHO_BASE, '+
                     '     SERVIDOR = :SERVIDOR, '+
                     '     OBSERVACOES = :OBSERVACOES, '+
                     '     VERSAO_CONVERSOR = :VERSAO_CONVERSOR, '+
                     '     PRODUTOS = :PRODUTOS, '+
                     '     CONTAS_RECEBER = :CONTAS_RECEBER, '+
                     '     CONTAS_PAGAR = :CONTAS_PAGAR, '+
                     '     FORNECEDORES = :FORNECEDORES, '+
                     '     CLIENTES = :CLIENTES, '+
                     '     ICMS_PADRAO_ESTADO = :ICMS_PADRAO_ESTADO, '+
                     '     MODULOS = :MODULOS, '+
                     '     PATH_IMG = :PATH_IMG  '+
                     'WHERE '+
                          'ID = :ID';


          for item in listSistema do
          begin
            ParamByName('ID').AsInteger                 := item.ID;
            ParamByName('SISTEMA').AsString             := item.Sistema;
            ParamByName('CIDADE').AsString              := item.Cidade;
            ParamByName('ESTADO').AsString              := item.Estado;
            ParamByName('VERSAO').AsString              := item.Versao;
            ParamByName('DATA_CRIACAO').AsDateTime      := item.DataCriacao;
            ParamByName('DATA_ALTERACAO').AsDateTime    := item.DataAlteracao;
            ParamByName('TIPO_BASE').AsString           := item.TipoBase;
            ParamByName('USUARIO').AsString             := item.Usuario;
            ParamByName('SENHA').AsString               := item.Senha;
            ParamByName('PORTA').AsInteger              := item.Porta;
            ParamByName('DRIVER').AsString              := item.Driver;
            ParamByName('NOME_BASE').AsString           := item.NomeBase;
            ParamByName('CAMINHO_BASE').AsString        := item.CaminhoBase;
            ParamByName('SERVIDOR').AsString            := item.Servidor;
            ParamByName('OBSERVACOES').AsString         := item.Observacoes;
            ParamByName('VERSAO_CONVERSOR').AsString    := item.VersaoConversor;
            ParamByName('PRODUTOS').AsInteger           := item.Produtos;
            ParamByName('CONTAS_RECEBER').AsInteger     := item.ContasReceber;
            ParamByName('CONTAS_PAGAR').AsInteger       := item.ContasPagar;
            ParamByName('FORNECEDORES').AsInteger       := item.Fornecedores;
            ParamByName('CLIENTES').AsInteger           := item.Clientes;
            ParamByName('ICMS_PADRAO_ESTADO').AsInteger := item.ICMSPadraoEstado;
            ParamByName('MODULOS').AsString             := item.Modulos;
            ParamByName('PATH_IMG').AsString            := item.PathImg;

          end;

          ExecSQL;

          Result := True;
        end;
      except
        Result := False;
      end;
    finally
      if Assigned(vQuery) then vQuery.Free;
    end;


end;



class function TGerenciadorController.DeleteSistema(Id: Integer) : Boolean;
var vQuery : TFDQuery;
begin

    Result := False;

    vQuery := TFDQuery.Create(nil);
    try
      try
        with vQuery do
        begin
          Connection := TInstanciaConexaoController.GetInstance().Conexao.GetConexao;
          SQL.Text := 'DELETE FROM SISTEMAS '+
                      'WHERE ID = :ID';

          ParamByName('ID').AsInteger := Id;
          ExecSQL;


          Result := True;
        end;
      except
        Result := False;
      end;
    finally
      if Assigned(vQuery) then vQuery.Free;      
    end;

end;





end.
