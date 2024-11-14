unit uHome;

interface

uses
  uSistemasVO,
  uGerenciadorController,
  frameListSistema,
  uInstanciaConexao,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts,
  FMX.ListBox, System.Generics.Collections;

type
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
    Rectangle6: TRectangle;
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
    Rectangle3: TRectangle;
    rtFotoSistema: TRectangle;
    Rectangle5: TRectangle;
    rtTipoBase: TRectangle;
    Image2: TImage;
    imgTipoBase: TImage;
    rtPopUpLeft: TRectangle;
    Rectangle4: TRectangle;
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
    procedure imgCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lboxSistemasClick(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure imgClosePopUpClick(Sender: TObject);
  private
    procedure EditarSistemaClick(Sender: TObject);
    procedure ExcluirSistemaClick(Sender: TObject);
    procedure ViewSistemaClick(Sender: Tobject);
    function PegaIdListItem(Sender: TObject): Integer;
    procedure LimpaEdtPopUP;
    procedure BloquearEdicaoEdtPopUP;

  public
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

  gapRight := lboxSistemas.Width / 10;

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


  item.OnClick      := lboxSistemasClick;


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


procedure TFHome.Rectangle6Click(Sender: TObject);
begin
    rtFundoEscuro.Visible := True;
    lyPopUp.Visible := True;

    LimpaEdtPopUP;

end;


procedure TFHome.LimpaEdtPopUP;
begin
    edtNomeSistema.Text     := '';
    edtCidadeSistema.Text   := '';
    edtEstadoSistema.Text   := '';
    edtVersaoSistema.Text   := '';
    edtTipoBaseSistema.Text := '';
    edtNomeBaseSistema.Text := '';
    edtPortaSistema.Text    := '';
    edtDriverSistema.Text   := '';
end;

procedure TFHome.BloquearEdicaoEdtPopUP;
begin
    edtNomeSistema.CanFocus     := False;
    edtCidadeSistema.CanFocus   := False;
    edtEstadoSistema.CanFocus   := False;
    edtVersaoSistema.CanFocus   := False;
    edtTipoBaseSistema.CanFocus := False;
    edtNomeBaseSistema.CanFocus := False;
    edtPortaSistema.CanFocus    := False;
    edtDriverSistema.CanFocus   := False;


    edtNomeSistema.Cursor       := crNo;
    edtCidadeSistema.Cursor     := crNo;
    edtEstadoSistema.Cursor     := crNo;
    edtVersaoSistema.Cursor     := crNo;
    edtTipoBaseSistema.Cursor   := crNo;
    edtNomeBaseSistema.Cursor   := crNo;
    edtPortaSistema.Cursor      := crNo;
    edtDriverSistema.Cursor     := crNo;


    edtNomeSistema.ReadOnly     := True;
    edtCidadeSistema.ReadOnly   := True;
    edtEstadoSistema.ReadOnly   := True;
    edtVersaoSistema.ReadOnly   := True;
    edtTipoBaseSistema.ReadOnly := True;
    edtNomeBaseSistema.ReadOnly := True;
    edtPortaSistema.ReadOnly    := True;
    edtDriverSistema.ReadOnly   := True;
end;


procedure TFHome.ViewSistemaClick(Sender:Tobject);
var
  item: TListBoxItem;
  parentControl: TFmxObject;
  ID_ITEM: Integer;

  list : TObjectList<TSistemasVO>;
  itemSistema : TSistemasVO;
begin

  ID_ITEM := PegaIdListItem(Sender);
  BloquearEdicaoEdtPopUP;

  if not Assigned(list) then
    list := TObjectList<TSistemasVO>.Create;

  list := TGerenciadorController.GetSistema(ID_ITEM);

  for itemSistema in list do
  begin
    edtNomeSistema.Text     := itemSistema.Sistema;
    edtCidadeSistema.Text   := itemSistema.Cidade;
    edtEstadoSistema.Text   := itemSistema.Estado;
    edtVersaoSistema.Text   := itemSistema.Versao;
    edtTipoBaseSistema.Text := itemSistema.TipoBase;
    edtNomeBaseSistema.Text := itemSistema.NomeBase;
    edtPortaSistema.Text    := IntToStr(itemSistema.Porta);
    edtDriverSistema.Text   := itemSistema.Driver;
  end;

  rtFundoEscuro.Visible := True;
  lyPopUp.Visible       := True;

end;



procedure TFHome.EditarSistemaClick(Sender:TObject);
var
  item : TListBoxItem;
  frame: TFListSistema;
  ID_ITEM:Integer;
begin
    item := TListBoxItem(Sender);

    frame := TFListSistema(item.Controls[1]);
    ID_ITEM := item.Tag;

    ShowMessage('EDITAR'+ IntToStr(ID_ITEM));

end;




procedure TFHome.ExcluirSistemaClick(Sender:TObject);
var
  item : TListBoxItem;
  frame: TFListSistema;
  ID_ITEM:Integer;
begin
    item := TListBoxItem(Sender);

    frame := TFListSistema(item.Controls[1]);
    ID_ITEM := item.Tag;

    ShowMessage('EXCLUIR'+ IntToStr(ID_ITEM));

end;




procedure TFHome.FormCreate(Sender: TObject);
var
  sistema: TSistemasVO;
begin
  rtFundoEscuro.Visible := False;

  if not Assigned(listSistema) then
    listSistema := TObjectList<TSistemasVO>.Create;

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


procedure TFHome.imgCloseClick(Sender: TObject);
begin
    Application.Terminate;
end;


procedure TFHome.imgClosePopUpClick(Sender: TObject);
begin
    lyPopUp.Visible       := False;
    rtFundoEscuro.Visible := False;
end;

procedure TFHome.lboxSistemasClick(Sender: TObject);
var
  item : TListBoxItem;
  frame: TFListSistema;
  ID_ITEM:Integer;
begin
    item := TListBoxItem(Sender);

    frame := TFListSistema(item.Controls[1]);
    ID_ITEM := item.Tag;

    ShowMessage( IntToStr(ID_ITEM) );

end;


end.
