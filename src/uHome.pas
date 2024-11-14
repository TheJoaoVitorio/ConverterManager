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
    procedure imgCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

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
  f: TFListSistema;
begin
    item         := TListBoxItem.Create(nil);
    item.HitTest := True;
    item.Tag     := ID;

    f := TFListSistema.Create(item);
    f.Parent                  := item;
    f.Align                   := TAlignLayout.Client;
    f.lblNomeSistema.Text     := Nome;
    f.lblCidadeSistema.Text   := Cidade;
    f.lblVersao.Text          := Versao;
    f.lblTipoBase.Text        := TipoBase;
    f.lblUsuarioSistema.Text  := Usuario;
    f.lblSenhaSistema.Text    := Senha;
    f.lblNomeBaseSistema.Text := NomeBase;

    item.AddObject(f);

    lboxSistemas.AddObject(item);
    lboxSistemas.ItemWidth  := 990;
    lboxSistemas.ItemHeight := 49;

end;


procedure TFHome.FormCreate(Sender: TObject);
var
  sistema: TSistemasVO;
begin

    if not Assigned(listSistema) then
      listSistema := TObjectList<TSistemasVO>.Create;

    listSistema := TGerenciadorController.GetSistemas;

    for sistema in listSistema do
    begin
      AddListSistema(sistema.ID,
                     sistema.Sistema,
                     sistema.Cidade,
                     sistema.Versao,
                     sistema.TipoBase,
                     sistema.Usuario,
                     sistema.Senha,
                     sistema.NomeBase);
    end;


end;

procedure TFHome.imgCloseClick(Sender: TObject);
begin
    Application.Terminate;
end;

end.
