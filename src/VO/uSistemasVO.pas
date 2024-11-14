unit uSistemasVO;

interface

type
  TSistemasVO = class
  private
    FID: Integer;
    FSistema: string;
    FCidade: string;
    FEstado: string;
    FVersao: string;
    FDataCriacao: TDateTime;
    FDataAlteracao: TDateTime;
    FTipoBase: string;
    FUsuario: string;
    FSenha: string;
    FNomeBase: string;
    FCaminhoBase: string;
    FServidor: string;
    FObservacoes: string;
    FVersaoConversor: string;

    FProdutos: SmallInt;
    FContasReceber: SmallInt;
    FContasPagar: SmallInt;
    FFornecedores: SmallInt;
    FClientes: SmallInt;

    FModulos: string;
    FPathImg: string;
    fBase64Img: String;
    FDriver: string;
    FPorta: Integer;
    FCaminhoBase2: string;
    FICMSPadraoEstado: SmallInt;

  public
    property ID:               Integer               read FID                             write FID;
    property Sistema:          string                read FSistema                        write FSistema;
    property Cidade:           string                read FCidade                         write FCidade;
    property Estado:           string                read FEstado                         write FEstado;
    property Versao:           string                read FVersao                         write FVersao;
    property DataCriacao:      TDateTime             read FDataCriacao                    write FDataCriacao;
    property DataAlteracao:    TDateTime             read FDataAlteracao                  write FDataAlteracao;
    property TipoBase:         string                read FTipoBase                       write FTipoBase;
    property Usuario:          string                read FUsuario                        write FUsuario;
    property Senha:            string                read FSenha                          write FSenha;
    property Porta:            Integer               read FPorta                          write FPorta;
    property Driver:           string                read FDriver                         write FDriver;
    property NomeBase:         string                read FNomeBase                       write FNomeBase;
    property CaminhoBase:      string                read FCaminhoBase                    write FCaminhoBase;
    property CaminhoBase2:     string                read FCaminhoBase2                   write FCaminhoBase2;


    property Servidor:         string                read FServidor                       write FServidor;
    property Observacoes:      string                read FObservacoes                    write FObservacoes;
    property VersaoConversor:  string                read FVersaoConversor                write FVersaoConversor;

    property Produtos:         SmallInt              read FProdutos                       write FProdutos;
    property ContasReceber:    SmallInt              read FContasReceber                  write FContasReceber;
    property ContasPagar:      SmallInt              read FContasPagar                    write FContasPagar;
    property Fornecedores:     SmallInt              read FFornecedores                   write FFornecedores;
    property Clientes:         SmallInt              read FClientes                       write FClientes;
    property ICMSPadraoEstado: SmallInt              read FICMSPadraoEstado               write FICMSPadraoEstado;

    property Modulos:          string                read FModulos                        write FModulos;

    property PathImg:          string                read FPathImg                        write FPathImg;
    property Base64Img:        String                read fBase64Img                      write fBase64Img;

  end;


implementation



end.
