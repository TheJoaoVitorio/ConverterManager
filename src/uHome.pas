unit uHome;

interface

uses
  uSistemasVO,
  uGerenciadorController,
  frameListSistema,
  uInstanciaConexao,
  Vcl.Graphics, System.StrUtils,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts,
  FMX.ListBox, System.Generics.Collections, FMX.TabControl, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, System.Actions, FMX.ActnList;

type
  TTiposBasesEnum = (FIREBIRD, POSTGRESQL,MYSQL,ORACLE, SQLSERVER,SQLITE,MONGODB,DBF,CSV);

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
    Label14: TLabel;
    rtBtnVoltarTabDados: TRectangle;
    Label17: TLabel;
    rtBtnTabSalvarDados: TRectangle;
    Label18: TLabel;
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
  private
    ID_SISTEMA_DELETAR : Integer;
    DatabaseImages: TDictionary<TTiposBasesEnum, string>;

    procedure ViewSistemaClick(Sender: Tobject);
    procedure EditarSistemaClick(Sender: TObject);
    procedure ExcluirSistemaClick(Sender: TObject);
    
    procedure ChamaPopUpComDados(ID: Integer);
    
    function GetValoresEdit: TObjectList<TSistemasVO>;
    function PegaIdListItem(Sender: TObject): Integer;
    
    procedure DesbloquearEdicaoEdtPopUP;
    procedure BloquearEdicaoEdtPopUP;
    procedure LimpaEdtPopUP;
    procedure ListarSistemas;
    function MapStringToEnum(const AText: string): TTiposBasesEnum;
    procedure PathImagesTiposBases;
    procedure AtualizarInterfacePosOperacao(const mensagem: string);
    //procedure BeforeDestruction ; override;
  public
    modoView   : Boolean;
    modoEditar : Boolean;
    modoCriacao: Boolean;


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
  FHome: TFHome;

implementation

{$R *.fmx}


procedure TFHome.FormCreate(Sender: TObject);
var
  sistema: TSistemasVO;
begin
  rtFundoEscuro.Visible := False;
  ListarSistemas;
  PathImagesTiposBases;

end;


procedure TFHome.FormDestroy(Sender: TObject);
begin
  if Assigned(DatabaseImages) then
    FreeAndNil(DatabaseImages);
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

  gapRight := (lboxSistemas.Width / 10) / Self.Width;

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
    item.Sistema     := edtNomeSistema.Text;
    item.Cidade      := edtCidadeSistema.Text;
    item.Estado      := edtEstadoSistema.Text;
    item.Versao      := edtVersaoSistema.Text;
    item.TipoBase    := edtTipoBaseSistema.Text;
    item.NomeBase    := edtNomeBaseSistema.Text;

    if edtPortaSistema.Text = '' then
      item.Porta := 0
    else
      item.Porta       := StrToInt(edtPortaSistema.Text);

    item.Driver      := edtDriverSistema.Text;
    item.Usuario     := edtUsuarioSistema.Text;
    item.Senha       := edtSenhaSistema.Text;
    item.Servidor    := edtServidorSistema.Text;
    item.Observacoes := edtObsSistema.Lines.Text;
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
    //if not Assigned(list) then
    //  list := TObjectList<TSistemasVO>.Create;

    list := TGerenciadorController.GetSistema(ID);

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
    NextTab.Execute;
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
end;


procedure TFHome.rtBtnVoltarTabDadosClick(Sender: TObject);
begin
    BackTab.Execute;
end;


procedure TFHome.rtOkTabFecharPopUpClick(Sender: TObject);
begin
    rtMensagemPopUp.Visible := False;
    lyPopUp.Visible := False;
    rtFundoEscuro.Visible := False;
    DesbloquearEdicaoEdtPopUP;
    lboxSistemas.Clear;
    ListarSistemas;
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
  rtBtnTabSalvarDados.Enabled := False;
  
  ChamaPopUpComDados(ID_ITEM);

end;


procedure TFHome.EditarSistemaClick(Sender:TObject);
var
  ID_ITEM:Integer;
begin
    ID_ITEM := PegaIdListItem(Sender);
    modoEditar := True;
    TabControl1.TabIndex := 0;

    ChamaPopUpComDados(ID_ITEM); //alimentar os Edits com as informa��es
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
    

    rtBtnTabSalvarDados.Enabled := True;
    lyPopUp.Visible       := False;
    rtFundoEscuro.Visible := False;
end;


end.
