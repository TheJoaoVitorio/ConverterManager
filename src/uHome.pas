unit uHome;

interface

uses
  uSistemasVO,
  uGerenciadorController,
  frameListSistema, frameRadioModulos,
  uInstanciaConexao,
  Vcl.Graphics, System.StrUtils,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts,
  FMX.ListBox, System.Generics.Collections, FMX.TabControl, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, System.Actions, FMX.ActnList, System.UIConsts,
  System.Rtti, System.TypInfo;

type
  TTiposBasesEnum = (FIREBIRD, POSTGRESQL,MYSQL,ORACLE, SQLSERVER,SQLITE,MONGODB,DBF,CSV);

  TModulosEnum = (Clientes, Produtos, Fornecedores, ContasReceber, ContasPagar );

  TFHome = class(TForm)
    navBar: TRectangle;
    Image1: TImage;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    header: TRectangle;
    imgMinimize: TImage;
    imgClose: TImage;
    headerContent: TRectangle;
    rtContent: TRectangle;
    headerAdicionarSistemas: TRectangle;
    Label3: TLabel;
    rtBtnAdicionarSistema: TRectangle;
    Image3: TImage;
    Label4: TLabel;
    rtBarraPesquisa: TRectangle;
    edtBuscaSistema: TEdit;
    StyleBook1: TStyleBook;
    lboxSistemas: TListBox;
    rtFundoEscuro: TRectangle;
    lyPopUp: TLayout;
    rtPopUp: TRectangle;
    rtTopoPopUp: TRectangle;
    imgClosePopUp: TImage;
    rtPopUpContent: TRectangle;
    rtPopUpContentMain: TRectangle;
    rtFotoSistema: TRectangle;
    Rectangle5: TRectangle;
    rtTipoBase: TRectangle;
    Image2: TImage;
    imgTipoBase: TImage;
    rtPopUpLeft: TRectangle;
    rtDados1: TRectangle;
    coluna1: TRectangle;
    coluna2: TRectangle;
    rtNomeSistema: TRectangle;
    Label1: TLabel;
    Rectangle9: TRectangle;
    edtNomeSistema: TEdit;
    rtEstadoSistema: TRectangle;
    Label2: TLabel;
    Rectangle10: TRectangle;
    edtEstadoSistema: TEdit;
    rtVersaoSistema: TRectangle;
    Label5: TLabel;
    Rectangle8: TRectangle;
    edtVersaoSistema: TEdit;
    rtCidadeSistema: TRectangle;
    Label6: TLabel;
    Rectangle11: TRectangle;
    edtCidadeSistema: TEdit;
    rtTipoBaseSistema: TRectangle;
    Label7: TLabel;
    Rectangle12: TRectangle;
    edtTipoBaseSistema: TEdit;
    rtNomeBaseSistema: TRectangle;
    Label8: TLabel;
    Rectangle13: TRectangle;
    edtNomeBaseSistema: TEdit;
    rtPortaSistema: TRectangle;
    Label9: TLabel;
    Rectangle15: TRectangle;
    edtPortaSistema: TEdit;
    rtDriverSistema: TRectangle;
    Label10: TLabel;
    Rectangle16: TRectangle;
    edtDriverSistema: TEdit;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    rtDados2: TRectangle;
    rtCol1: TRectangle;
    rtUsuario: TRectangle;
    Label11: TLabel;
    Rectangle17: TRectangle;
    edtUsuarioSistema: TEdit;
    rtCaminhoBase: TRectangle;
    Label12: TLabel;
    Rectangle19: TRectangle;
    edtCaminhoBaseSistema: TEdit;
    rtObs: TRectangle;
    Label90: TLabel;
    Rectangle21: TRectangle;
    rtCol2: TRectangle;
    rtSenhaSistema: TRectangle;
    Label15: TLabel;
    Rectangle26: TRectangle;
    edtSenhaSistema: TEdit;
    rtServidor: TRectangle;
    Label16: TLabel;
    Rectangle28: TRectangle;
    edtServidorSistema: TEdit;
    edtObsSistema: TMemo;
    ActionList1: TActionList;
    NextTab: TNextTabAction;
    rtBtnProxTabDados: TRectangle;
    lblBtnProxTabDados: TLabel;
    rtBtnVoltarTabDados: TRectangle;
    Label17: TLabel;
    BackTab: TPreviousTabAction;
    rtMensagemPopUp: TRectangle;
    Image4: TImage;
    lblMensagemPopUp: TLabel;
    rtOkTabFecharPopUp: TRectangle;
    Label19: TLabel;
    lyDeleteSistemaPopUp: TLayout;
    rtDeleteSistema: TRectangle;
    Image5: TImage;
    Label13: TLabel;
    rtBtnDeletarSistema: TRectangle;
    Label20: TLabel;
    rtBtnNaoDeletarSistema: TRectangle;
    Label21: TLabel;
    Rectangle3: TRectangle;
    lboxRadioModulos: TListBox;
    rtBuscar: TRectangle;
    Image6: TImage;
    procedure imgCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rtBtnAdicionarSistemaClick(Sender: TObject);
    procedure imgClosePopUpClick(Sender: TObject);
    procedure rtBtnProxTabDadosClick(Sender: TObject);
    procedure rtBtnVoltarTabDadosClick(Sender: TObject);
    procedure rtBtnTabSalvarDadosClick(Sender: TObject);
    procedure rtOkTabFecharPopUpClick(Sender: TObject);
    procedure edtPortaSistemaTyping(Sender: TObject);
    procedure edtTipoBaseSistemaChange(Sender: TObject);
    procedure rtBtnDeletarSistemaClick(Sender: TObject);
    procedure rtBtnNaoDeletarSistemaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgMinimizeClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure rtBuscarClick(Sender: TObject);

  private
    ID_SISTEMA_EDITAR  : Integer;
    ID_SISTEMA_DELETAR : Integer;
    DatabaseImages: TDictionary<TTiposBasesEnum, string>;

    procedure ViewSistemaClick(Sender: Tobject);
    procedure EditarSistemaClick(Sender: TObject);
    procedure ExcluirSistemaClick(Sender: TObject);
    
    procedure ChamaPopUpComDados(ID: Integer);
    
    function GetValoresEdit: TObjectList<TSistemasVO>;
    function PegaIdListItem(Sender: TObject): Integer;
    function MapStringToEnum(const AText: string): TTiposBasesEnum;

    procedure DesbloquearEdicaoEdtPopUP;
    procedure BloquearEdicaoEdtPopUP;
    procedure LimpaEdtPopUP;
    procedure ListarSistemas;
    procedure PathImagesTiposBases;
    procedure AtualizarInterfacePosOperacao(const mensagem: string);
    procedure ModuloClick(Sender: TObject);
    procedure PovoaModulosEscolhidos(NomeModulo:String ; Status:Boolean);

    class function ObterModuloEnum(const NomeModulo: string): TModulosEnum; static;

    procedure SalvaModuloEscolhidoProdutos(Status: Boolean);
    procedure SalvaModuloEscolhidoClientes(Status: Boolean);
    procedure SalvaModuloEscolhidoContasPagar(Status: Boolean);
    procedure SalvaModuloEscolhidoContasReceber(Status: Boolean);
    procedure SalvaModuloEscolhidoFornecedores(Status: Boolean);

    procedure SetPropertyByName(AObject: TObject;
      const PropertyName: string; const Value: TValue);
    procedure DefineCamposDefaultConexao(AValue : TTiposBasesEnum);
    procedure DefineCamposDefaultFirebird;
    procedure DefineCamposDefaultPostgresql;
    procedure DefineCamposDefaultMySql;

    //procedure BeforeDestruction ; override;
  public
    modoView   : Boolean;
    modoEditar : Boolean;
    modoCriacao: Boolean;

    procedure AddModuloSistema(ID_SISTEMA: Integer; NomeModulo:String ; Status : Boolean);
    procedure AddListSistema(ID :Integer;
                             Nome:String;
                             Cidade:String;
                             Versao:String;
                             TipoBase:String;
                             Usuario:String;
                             Senha:String;
                             NomeBase:String);


  end;

var
  listSistema : TObjectList<TSistemasVO>;
  sistemaVO   : TSistemasVO;
  FHome: TFHome;

implementation

{$R *.fmx}


procedure TFHome.FormCreate(Sender: TObject);
begin
  rtFundoEscuro.Visible := False;
  ListarSistemas;
  PathImagesTiposBases;

  if not Assigned(sistemaVO) then
    sistemaVO := TSistemasVO.Create;

    Self.Width  := Round(Screen.Width);
    Self.Height := Round(Screen.Height - 30);


end;


procedure TFHome.FormDestroy(Sender: TObject);
begin

  if Assigned(DatabaseImages) then
    FreeAndNil(DatabaseImages);

  if Assigned(sistemaVO) then
    FreeAndNil(sistemaVO);

end;


procedure TFHome.ListarSistemas;
var
  sistema: TSistemasVO;
begin
  //if not Assigned(listSistema) then
  //  listSistema := TObjectList<TSistemasVO>.Create;

  listSistema := TGerenciadorController.GetSistemas;
  lboxSistemas.ItemHeight := 50;


  for sistema in listSistema do
  begin
    try
      lboxSistemas.BeginUpdate;
      AddListSistema(sistema.ID, sistema.Sistema, sistema.Cidade,
                     sistema.Versao, sistema.TipoBase,
                     sistema.Usuario, sistema.Senha, sistema.NomeBase);
    finally
      lboxSistemas.EndUpdate;
    end;
  end;


end;


procedure TFHome.AddListSistema(ID: Integer; Nome, Cidade, Versao, TipoBase,
  Usuario, Senha, NomeBase: String);
var
  item: TListBoxItem;
  f: TFListSistema;  //Frame
  gapRight : Single;
begin
  item := TListBoxItem.Create(nil);
  item.HitTest    := True;
  item.Tag        := ID;
  item.Selectable := True;
  item.Cursor     := crHandPoint;


  f := TFListSistema.Create(item);
  f.Parent := item;
  f.HitTest := TRue;

  f.imgViewSistema.OnClick     :=  ViewSistemaClick;
  f.imgEditarSistema.OnClick   :=  EditarSistemaClick;
  f.imgExcluirSistema.OnClick  :=  ExcluirSistemaClick;

  gapRight := 0;
  gapRight := (720 / 10);

  with f do
  begin
    Parent := item;
    Align  := TAlignLayout.Client;

    lblNomeSistema.Text             := Nome;
    lblNomeSistema.Margins.Right    := gapRight;

    lblCidadeSistema.Text           := Cidade;
    lblCidadeSistema.Margins.Right  := gapRight;

    lblVersao.Text                  := Versao;
    lblVersao.Margins.Right         := gapRight;

    lblTipoBase.Text                := TipoBase;
    lblTipoBase.Margins.Right       := gapRight;

    lblUsuarioSistema.Text          := Usuario;
    lblUsuarioSistema.Margins.Right := gapRight;

    lblSenhaSistema.Text            := Senha;
    lblSenhaSistema.Margins.Right   := gapRight;

    lblNomeBaseSistema.Text         := NomeBase;
    lblNomeBaseSistema.Margins.Right:= gapRight;

  end;

  item.Parent := lboxSistemas;
  item.AddObject(f);
  lboxSistemas.AddObject(item);

end;


procedure TFHome.AddModuloSistema(ID_SISTEMA: Integer; NomeModulo:String ; Status : Boolean);
var
  item: TListBoxItem;
  f : TFRadioModulos;
begin
  item := TListBoxItem.Create(nil);
  item.HitTest    := True;
  item.Tag        := ID_SISTEMA;
  item.Selectable := True;
  item.Margins.Bottom := 8;

  f := TFRadioModulos.Create(item);
  f.Parent := item;
  f.HitTest := True;
  f.Name := 'Frame';


  f.lblNomeModulo.OnClick := ModuloClick;
  f.crRadioButton.OnClick := ModuloClick;
  f.imgChecked.OnClick    := ModuloClick;


  with f do
  begin
    Parent := item;
    lblNomeModulo.Text := NomeModulo;

    if Status then
      begin
        imgChecked.Visible := True;
        crRadioButton.Fill.Color := TAlphaColors.Dodgerblue;
        SetPropertyByName( sistemaVO , NomeModulo , 1 );
      end
    else
      begin
        imgChecked.Visible := False;
        crRadioButton.Fill.Color := StringToAlphaColor('#FF1E2531');
        SetPropertyByName( sistemaVO , NomeModulo , 0 );
      end;

    item.Parent := lboxRadioModulos;
    item.AddObject(f);
    lboxRadioModulos.AddObject(item);

  end;

end;


procedure TFHome.SetPropertyByName(AObject: TObject; const PropertyName: string; const Value: TValue);
var
  Context: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
begin
  // Obt�m o contexto de RTTI
  Context := TRttiContext.Create;
  try
    // Obt�m o tipo do objeto
    RttiType := Context.GetType(AObject.ClassType);

    // Busca pela propriedade com o nome fornecido
    RttiProperty := RttiType.GetProperty(PropertyName);

    if Assigned(RttiProperty) and RttiProperty.IsWritable then
      RttiProperty.SetValue(AObject, Value)
    else
      raise Exception.CreateFmt('A propriedade "%s" n�o existe ou n�o � atribu�vel.', [PropertyName]);
  finally
    Context.Free;
  end;
end;


procedure TFHome.ModuloClick(Sender: TObject);
var
  ParentControl: TFmxObject;
  Modulo: TFRadioModulos;
begin

  if not (modoEditar or modoCriacao) then
    Exit;

  // Identificar o componente pai
  ParentControl := (Sender as TControl).Parent;

  // Verificar se o pai � o TListBoxItem e buscar o TFRadioModulos
  while ParentControl <> nil do
  begin
    if ParentControl is TFRadioModulos then
    begin
      Modulo := TFRadioModulos(ParentControl);

      // Alternar o status de ativa��o/desativa��o
      if Modulo.imgChecked.Visible then
      begin

        PovoaModulosEscolhidos(Modulo.lblNomeModulo.Text, False);

        Modulo.imgChecked.Visible := False;
        Modulo.crRadioButton.Fill.Color := StringToAlphaColor('#FF1E2531');
      end
      else
      begin

        PovoaModulosEscolhidos(Modulo.lblNomeModulo.Text, True);


        Modulo.imgChecked.Visible := True;
        Modulo.crRadioButton.Fill.Color := TAlphaColors.Dodgerblue;
      end;

      Exit; // Sa�da ap�s encontrar o m�dulo
    end;

    ParentControl := ParentControl.Parent;
  end;
end;



procedure TFHome.PovoaModulosEscolhidos(NomeModulo:String ; Status:Boolean);
begin
  case ObterModuloEnum(NomeModulo) of

    Produtos      : SalvaModuloEscolhidoProdutos(Status);

    Clientes      : SalvaModuloEscolhidoClientes(Status);

    Fornecedores  : SalvaModuloEscolhidoFornecedores(Status);

    ContasReceber : SalvaModuloEscolhidoContasReceber(Status);

    ContasPagar   : SalvaModuloEscolhidoContasPagar(Status);

  end;

end;



procedure TFHome.SalvaModuloEscolhidoProdutos(Status:Boolean);
begin
    sistemaVO.Produtos := Ord(Status);
end;


procedure TFHome.SalvaModuloEscolhidoClientes(Status:Boolean);
begin
    sistemaVO.Clientes := Ord(Status);
end;


procedure TFHome.SalvaModuloEscolhidoFornecedores(Status:Boolean);
begin
    sistemaVO.Fornecedores := Ord(Status);
end;


procedure TFHome.SalvaModuloEscolhidoContasReceber(Status:Boolean);
begin
    sistemaVO.ContasReceber := Ord(Status);
end;


procedure TFHome.SalvaModuloEscolhidoContasPagar(Status:Boolean);
begin
    sistemaVO.ContasPagar := Ord(Status);
end;



function TFHome.PegaIdListItem(Sender:TObject) : Integer;
var
  item: TListBoxItem;
  parentControl: TFmxObject;
begin
  // Come�a pelo Sender (o componente clicado, no caso a imagem)
  parentControl := Sender as TFmxObject;


  // Navega pela hierarquia para encontrar o TListBoxItem pai
  while (parentControl <> nil) and not (parentControl is TListBoxItem) do
    parentControl := parentControl.Parent;


  // Se encontrou o TListBoxItem
  if parentControl is TListBoxItem then
  begin
    item := TListBoxItem(parentControl);
    Result := item.Tag;
  end


end;


function TFHome.GetValoresEdit : TObjectList<TSistemasVO>;
var
  item : TSistemasVO;
begin

  Result := TObjectList<TSistemasVO>.Create;

  item := TSistemasVO.Create;
  try
    item.ID          := ID_SISTEMA_EDITAR;
    item.Sistema     := edtNomeSistema.Text;
    item.Cidade      := edtCidadeSistema.Text;
    item.Estado      := edtEstadoSistema.Text;
    item.Versao      := edtVersaoSistema.Text;
    item.TipoBase    := edtTipoBaseSistema.Text;
    item.NomeBase    := edtNomeBaseSistema.Text;
    item.CaminhoBase := edtCaminhoBaseSistema.Text;

    if edtPortaSistema.Text = '' then
      item.Porta := 0
    else
      item.Porta       := StrToInt(edtPortaSistema.Text);

    item.Driver        := edtDriverSistema.Text;
    item.Usuario       := edtUsuarioSistema.Text;
    item.Senha         := edtSenhaSistema.Text;
    item.Servidor      := edtServidorSistema.Text;
    item.Observacoes   := edtObsSistema.Lines.Text;

    item.Produtos      := sistemaVO.Produtos;
    item.Clientes      := sistemaVO.Clientes;
    item.Fornecedores  := sistemaVO.Fornecedores;
    item.ContasReceber := sistemaVO.ContasReceber;
    item.ContasPagar   := sistemaVO.ContasPagar;

    Result.Add(item);
  except
    item.Free;
    raise;
  end;

end;



procedure TFHome.ChamaPopUpComDados(ID: Integer);
var
  list : TObjectList<TSistemasVO>;
  itemSistema : TSistemasVO;
begin

    list := TGerenciadorController.GetSistema(ID);                                       //////////

    for itemSistema in list do
    begin
      edtNomeSistema.Text        := itemSistema.Sistema;
      edtCidadeSistema.Text      := itemSistema.Cidade;
      edtEstadoSistema.Text      := itemSistema.Estado;
      edtVersaoSistema.Text      := itemSistema.Versao;
      edtTipoBaseSistema.Text    := itemSistema.TipoBase;
      edtNomeBaseSistema.Text    := itemSistema.NomeBase;
      edtPortaSistema.Text       := IntToStr(itemSistema.Porta);
      edtDriverSistema.Text      := itemSistema.Driver;
      edtUsuarioSistema.Text     := itemSistema.Usuario;
      edtSenhaSistema.Text       := itemSistema.Senha;
      edtCaminhoBaseSistema.Text := itemSistema.CaminhoBase;
      edtServidorSistema.Text    := itemSistema.Servidor;
      edtObsSistema.Lines.Add(itemSistema.Observacoes);

      AddModuloSistema(
        itemSistema.ID,
        'Produtos',
        StrToBool( IntToStr((itemSistema.Produtos)))
      );

      AddModuloSistema(
        itemSistema.ID,
        'Clientes',
        StrToBool( IntToStr((itemSistema.Clientes)))
      );

      AddModuloSistema(
        itemSistema.ID,
        'Fornecedores',
        StrToBool( IntToStr((itemSistema.Fornecedores)))
      );

      AddModuloSistema(
        itemSistema.ID,
        'ContasReceber',
        StrToBool( IntToStr((itemSistema.ContasReceber)))
      );

      AddModuloSistema(
        itemSistema.ID,
        'ContasPagar',
        StrToBool( IntToStr((itemSistema.ContasPagar)))
      );

    end;

    rtFundoEscuro.Visible := True;
    lyPopUp.Visible       := True;

end;


/// Events
procedure TFHome.rtBtnAdicionarSistemaClick(Sender: TObject);
begin
    modoCriacao := True;
    rtFundoEscuro.Visible := True;
    TabControl1.TabIndex := 0;
    lyPopUp.Visible := True;
    lboxRadioModulos.Clear;

    AddModuloSistema(0,'Produtos',False);
    AddModuloSistema(0,'Clientes',False);
    AddModuloSistema(0,'Fornecedores',False);
    AddModuloSistema(0,'ContasReceber',False);
    AddModuloSistema(0,'ContasPagar',False);

    LimpaEdtPopUP;

end;


procedure TFHome.rtBtnDeletarSistemaClick(Sender: TObject);
begin
    if not ID_SISTEMA_DELETAR < 0 then
    begin
        TGerenciadorController.DeleteSistema(ID_SISTEMA_DELETAR);
        lyDeleteSistemaPopUp.Visible := False;
        rtFundoEscuro.Visible := False;
        lboxSistemas.Clear;
        ListarSistemas;
    end;

end;

procedure TFHome.rtBtnNaoDeletarSistemaClick(Sender: TObject);
begin
    lyDeleteSistemaPopUp.Visible := False;
    rtFundoEscuro.Visible := False;
end;

procedure TFHome.rtBtnProxTabDadosClick(Sender: TObject);
begin

    if TabControl1.TabIndex = 0 then
      NextTab.Execute //////////////////////
    else
      rtBtnTabSalvarDadosClick(Sender);
      
end;


procedure TFHome.rtBtnTabSalvarDadosClick(Sender: TObject);
var
  listDados: TObjectList<TSistemasVO>;
  sucesso: Boolean;
  mensagem: string;
begin
  listDados := GetValoresEdit;

  if modoCriacao then
    sucesso := TGerenciadorController.InsertSistema(listDados)
  else if modoEditar then
    sucesso := TGerenciadorController.UpdateSistema(listDados)
  else
    Exit;

  if sucesso then
    mensagem := IfThen(modoCriacao, 'Sistema criado com sucesso!', 'Editado com sucesso!')
  else
    mensagem := 'N�o foi poss�vel concluir o processo!';

  AtualizarInterfacePosOperacao(mensagem);
end;


procedure TFHome.AtualizarInterfacePosOperacao(const mensagem: string);
begin
  rtPopUpContentMain.Enabled := True;
  lblMensagemPopUp.Text := mensagem;
  lblMensagemPopUp.Margins.Left := 10;
  lblMensagemPopUp.Margins.Right := 10;
  rtMensagemPopUp.Visible := True;
  modoEditar := False;
  modoCriacao := False;
  DesbloquearEdicaoEdtPopUP;
  lboxSistemas.Clear;
end;


procedure TFHome.rtBtnVoltarTabDadosClick(Sender: TObject);
begin
    BackTab.Execute;
end;


procedure TFHome.rtBuscarClick(Sender: TObject);
var
  sistema : TSistemasVO;
begin

  lboxSistemas.Clear;
  listSistema             := TGerenciadorController.GetSistemaPesquisa(edtBuscaSistema.Text);
  lboxSistemas.ItemHeight := 50;


  for sistema in listSistema do
  begin
    try

      lboxSistemas.BeginUpdate;
      AddListSistema(sistema.ID, sistema.Sistema, sistema.Cidade,
                     sistema.Versao, sistema.TipoBase,
                     sistema.Usuario, sistema.Senha, sistema.NomeBase);
    finally
      lboxSistemas.EndUpdate;
    end;
  end;
end;

procedure TFHome.rtOkTabFecharPopUpClick(Sender: TObject);
begin
    rtMensagemPopUp.Visible := False;
    lyPopUp.Visible := False;
    rtFundoEscuro.Visible := False;
    DesbloquearEdicaoEdtPopUP;
    try
    lboxSistemas.BeginUpdate;
    lboxSistemas.Clear;

    ListarSistemas;
    finally
    lboxSistemas.EndUpdate;
    end;


end;



procedure TFHome.TabControl1Change(Sender: TObject);
begin

    if TabControl1.TabIndex = 0 then
    begin
      rtBtnVoltarTabDados.Visible := False;
      rtBtnProxTabDados.Enabled := True;
      lblBtnProxTabDados.Text := 'Proximo';
    end;


    if TabControl1.TabIndex = 1 then
    begin
      rtBtnVoltarTabDados.Visible := True;

      if modoView then
        rtBtnProxTabDados.Enabled := False
      else
        rtBtnProxTabDados.Enabled := True;

      if modoCriacao then
        lblBtnProxTabDados.Text := 'Salvar';

    end;

end;


/// Actions
procedure TFHome.ViewSistemaClick(Sender:Tobject);
var
  ID_ITEM: Integer;
begin
  modoView := True;
  TabControl1.TabIndex := 0;
  ID_ITEM := PegaIdListItem(Sender);
  BloquearEdicaoEdtPopUP;
  lboxRadioModulos.Clear;
  //rtBtnTabSalvarDados.Enabled := False;
  
  ChamaPopUpComDados(ID_ITEM);

end;


procedure TFHome.EditarSistemaClick(Sender:TObject);
begin
    ID_SISTEMA_EDITAR := PegaIdListItem(Sender);
    modoEditar := True;
    TabControl1.TabIndex := 0;
    lboxRadioModulos.Clear;



    ChamaPopUpComDados(ID_SISTEMA_EDITAR); //alimentar os Edits com as informa��es
end;


procedure TFHome.ExcluirSistemaClick(Sender:TObject);
begin
    ID_SISTEMA_DELETAR := PegaIdListItem(Sender);

    lyDeleteSistemaPopUp.Visible := True;
    rtFundoEscuro.Visible        := True;
end;


/// Actions

procedure TFHome.BloquearEdicaoEdtPopUP;
begin
    edtNomeSistema.CanFocus         := False;
    edtCidadeSistema.CanFocus       := False;
    edtEstadoSistema.CanFocus       := False;
    edtVersaoSistema.CanFocus       := False;
    edtTipoBaseSistema.CanFocus     := False;
    edtNomeBaseSistema.CanFocus     := False;
    edtPortaSistema.CanFocus        := False;
    edtDriverSistema.CanFocus       := False;
    edtUsuarioSistema.CanFocus      := False;
    edtSenhaSistema.CanFocus        := False;
    edtCaminhoBaseSistema.CanFocus  := False;
    edtServidorSistema.CanFocus     := False;
    edtObsSistema.CanFocus          := False;


    edtNomeSistema.Cursor       := crNo;
    edtCidadeSistema.Cursor     := crNo;
    edtEstadoSistema.Cursor     := crNo;
    edtVersaoSistema.Cursor     := crNo;
    edtTipoBaseSistema.Cursor   := crNo;
    edtNomeBaseSistema.Cursor   := crNo;
    edtPortaSistema.Cursor      := crNo;
    edtDriverSistema.Cursor     := crNo;
    edtUsuarioSistema.Cursor    := crNo;
    edtSenhaSistema.Cursor      := crNo;
    edtCaminhoBaseSistema.Cursor:= crNo;
    edtServidorSistema.Cursor   := crNo;
    edtObsSistema.Cursor        := crNo;

    edtNomeSistema.ReadOnly       := True;
    edtCidadeSistema.ReadOnly     := True;
    edtEstadoSistema.ReadOnly     := True;
    edtVersaoSistema.ReadOnly     := True;
    edtTipoBaseSistema.ReadOnly   := True;
    edtNomeBaseSistema.ReadOnly   := True;
    edtPortaSistema.ReadOnly      := True;
    edtDriverSistema.ReadOnly     := True;
    edtUsuarioSistema.ReadOnly    := True;
    edtSenhaSistema.ReadOnly      := True;
    edtCaminhoBaseSistema.ReadOnly:= True;
    edtServidorSistema.ReadOnly   := True;
    edtObsSistema.ReadOnly        := True;
end;


procedure TFHome.DesbloquearEdicaoEdtPopUP;
begin
    edtNomeSistema.CanFocus         := True;
    edtCidadeSistema.CanFocus       := True;
    edtEstadoSistema.CanFocus       := True;
    edtVersaoSistema.CanFocus       := True;
    edtTipoBaseSistema.CanFocus     := True;
    edtNomeBaseSistema.CanFocus     := True;
    edtPortaSistema.CanFocus        := True;
    edtDriverSistema.CanFocus       := True;
    edtUsuarioSistema.CanFocus      := True;
    edtSenhaSistema.CanFocus        := True;
    edtCaminhoBaseSistema.CanFocus  := True;
    edtServidorSistema.CanFocus     := True;
    edtObsSistema.CanFocus          := True;

    edtNomeSistema.Cursor       := crIBeam;
    edtCidadeSistema.Cursor     := crIBeam;
    edtEstadoSistema.Cursor     := crIBeam;
    edtVersaoSistema.Cursor     := crIBeam;
    edtTipoBaseSistema.Cursor   := crIBeam;
    edtNomeBaseSistema.Cursor   := crIBeam;
    edtPortaSistema.Cursor      := crIBeam;
    edtDriverSistema.Cursor     := crIBeam;
    edtUsuarioSistema.Cursor    := crIBeam;
    edtSenhaSistema.Cursor      := crIBeam;
    edtCaminhoBaseSistema.Cursor:= crIBeam;
    edtServidorSistema.Cursor   := crIBeam;
    edtObsSistema.Cursor        := crIBeam;

    edtNomeSistema.ReadOnly       := False;
    edtCidadeSistema.ReadOnly     := False;
    edtEstadoSistema.ReadOnly     := False;
    edtVersaoSistema.ReadOnly     := False;
    edtTipoBaseSistema.ReadOnly   := False;
    edtNomeBaseSistema.ReadOnly   := False;
    edtPortaSistema.ReadOnly      := False;
    edtDriverSistema.ReadOnly     := False;
    edtUsuarioSistema.ReadOnly    := False;
    edtSenhaSistema.ReadOnly      := False;
    edtCaminhoBaseSistema.ReadOnly:= False;
    edtServidorSistema.ReadOnly   := False;
    edtObsSistema.ReadOnly        := False;
end;


procedure TFHome.LimpaEdtPopUP;
begin
    edtNomeSistema.Text        := '';
    edtCidadeSistema.Text      := '';
    edtEstadoSistema.Text      := '';
    edtVersaoSistema.Text      := '';
    edtTipoBaseSistema.Text    := '';
    edtNomeBaseSistema.Text    := '';
    edtPortaSistema.Text       := '';
    edtDriverSistema.Text      := '';
    edtUsuarioSistema.Text     := '';
    edtSenhaSistema.Text       := '';
    edtCaminhoBaseSistema.Text := '';
    edtServidorSistema.Text    := '';
    edtObsSistema.Text         := '';
end;


class function TFHome.ObterModuloEnum(const NomeModulo: string): TModulosEnum;
var
  Context: TRttiContext;
  RttiType: TRttiType;
  EnumName: string;
  i: Integer;
begin
  RttiType := Context.GetType(TypeInfo(TModulosEnum));

  // Itera sobre todos os valores de TModulosEnum
  for i := Ord(Low(TModulosEnum)) to Ord(High(TModulosEnum)) do
  begin
    EnumName := GetEnumName(TypeInfo(TModulosEnum), i);
    if SameText(EnumName, NomeModulo) then
    begin
      Result := TModulosEnum(i);
      Exit;
    end;
  end;

end;


function TFHome.MapStringToEnum(const AText: string): TTiposBasesEnum;
begin
  if SameText(AText, 'FIREBIRD') then
    Result := Firebird
  else if SameText(AText, 'POSTGRESQL') then
    Result := PostgreSQL
  else if SameText(AText, 'MYSQL') then
    Result := MySQL
  else if SameText(AText, 'ORACLE') then
    Result := Oracle
  else if SameText(AText, 'SQLSERVER') then
    Result := SQLServer
  else if SameText(AText, 'SQLITE') then
    Result := SQLite
  else if SameText(AText, 'MONGODB') then
    Result := MongoDB
  else if SameText(AText, 'DBF') then
    Result := DBF
  else if SameText(AText, 'CSV') then
    Result := CSV
  else
    Result := TTiposBasesEnum(-1);  // Valor inv�lido
end;


procedure TFHome.PathImagesTiposBases;
begin
    DatabaseImages := TDictionary<TTiposBasesEnum, string>.Create;

    DatabaseImages.Add(FIREBIRD,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\firebird.png'));

    DatabaseImages.Add(POSTGRESQL,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\postgresql.png'));

    DatabaseImages.Add(MYSQL,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\mysql.png'));

    DatabaseImages.Add(ORACLE,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\oracle.png'));

    DatabaseImages.Add(SQLSERVER,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\sqlserver.png'));

    DatabaseImages.Add(SQLITE,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\sqlite.png'));

    DatabaseImages.Add(MONGODB,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\mongodb.png'));

    DatabaseImages.Add(DBF,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\dbf.png'));

    DatabaseImages.Add(CSV,
                       ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\csv.png'));

end;




procedure TFHome.edtPortaSistemaTyping(Sender: TObject);
var
  Key : Char;
  Edit: TEdit;
begin
  Edit := TEdit(Sender);

  // Verifique se o texto n�o est� vazio antes de acessar o �ltimo caractere
  if Edit.Text.Length > 0 then
  begin
    Key := Edit.Text.Chars[Edit.Text.Length - 1];
    if not (Key in ['0'..'9']) then
    begin
      // Remove o �ltimo caractere inv�lido digitado
      Edit.Text := Edit.Text.Remove(Edit.Text.Length - 1);
      Edit.GoToTextEnd; // Move o cursor para o final
    end;
  end;

end;


procedure TFHome.edtTipoBaseSistemaChange(Sender: TObject);
var
  TipoBase: TTiposBasesEnum;
  ImagePath, TextEdit: string;
begin
  TextEdit := StringReplace(edtTipoBaseSistema.Text, ' ', '', [rfReplaceAll]);

  // Usa a fun��o para mapear a string digitada para o enum
  TipoBase := MapStringToEnum(TextEdit);

  DefineCamposDefaultConexao(TipoBase);

  // Se o valor de TipoBase foi atribu�do corretamente, busca a imagem correspondente
  if TipoBase <> TTiposBasesEnum(-1) then
  begin
    if DatabaseImages.TryGetValue(TipoBase, ImagePath) then
    begin
      imgTipoBase.Bitmap.LoadFromFile(ImagePath); // Carrega a imagem correspondente
    end
    else
    begin
      imgTipoBase.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\databasedefault.png'));
    end;
  end
  else
  begin
    imgTipoBase.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\src\img\databasedefault.png'));
  end;

end;

procedure TFHome.DefineCamposDefaultConexao(AValue : TTiposBasesEnum);
begin
  case AValue of
    FIREBIRD     : DefineCamposDefaultFirebird ;
    POSTGRESQL   : DefineCamposDefaultPostgresql;
    MYSQL        : DefineCamposDefaultMySql;
    ORACLE       : ;
    SQLSERVER    : ;
    SQLITE       : ;
    MONGODB      : ;
    DBF          : ;
    CSV          : ;
  end;


end;

procedure TFHome.DefineCamposDefaultFirebird;
begin
  edtPortaSistema.Text    := '3050';
  edtDriverSistema.Text   := 'FB';
  edtUsuarioSistema.Text  := 'SYSDBA';
  edtSenhaSistema.Text    := 'masterkey';

end;

procedure TFHome.DefineCamposDefaultPostgresql;
begin
  edtPortaSistema.Text    := '5432';
  edtDriverSistema.Text   := 'PG';
  edtUsuarioSistema.Text  := 'postgres';
  edtSenhaSistema.Text    := '';

end;

procedure TFHome.DefineCamposDefaultMySql;
begin
  edtPortaSistema.Text    := '3306';
  edtDriverSistema.Text   := 'MYSQL';
  edtUsuarioSistema.Text  := 'root';
  edtSenhaSistema.Text    := '';

end;


procedure TFHome.imgCloseClick(Sender: TObject);
begin
    Application.Terminate;
end;


procedure TFHome.imgClosePopUpClick(Sender: TObject);
begin
    modoView    := False;
    modoEditar  := False;
    modoCriacao := False;
    DesbloquearEdicaoEdtPopUP;
    

    //rtBtnTabSalvarDados.Enabled := True;
    lyPopUp.Visible       := False;
    rtFundoEscuro.Visible := False;
end;


procedure TFHome.imgMinimizeClick(Sender: TObject);
begin
   Self.WindowState := TWindowState.wsMinimized
end;

end.
