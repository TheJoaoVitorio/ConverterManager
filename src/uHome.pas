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
    procedure imgCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lboxSistemasClick(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
  private
    procedure EditarSistemaClick(Sender: TObject);
    procedure ExcluirSistemaClick(Sender: TObject);
    procedure ViewSistemaClick(Sender: Tobject);
    function PegaIdListItem(Sender: TObject): Integer;

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
  f.HitTest := False;

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

  item.Parent := lboxSistemas;
  item.OnClick := lboxSistemasClick;

  //item.AddObject(f);
  //lboxSistemas.AddObject(item);


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
end;

procedure TFHome.ViewSistemaClick(Sender:Tobject);
var
  item: TListBoxItem;
  parentControl: TFmxObject;
  ID_ITEM: Integer;
begin

  ID_ITEM := PegaIdListItem(Sender);

  TGerenciadorController.GetSistema(ID_ITEM);

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
