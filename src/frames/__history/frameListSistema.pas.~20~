unit frameListSistema;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFListSistema = class(TFrame)
    lblNomeSistema: TLabel;
    lblCidadeSistema: TLabel;
    lblVersao: TLabel;
    lblTipoBase: TLabel;
    lblUsuarioSistema: TLabel;
    lblSenhaSistema: TLabel;
    lblNomeBaseSistema: TLabel;
    imgViewSistema: TImage;
    rtEditarSistema: TRectangle;
    rtExcluirSistema: TRectangle;
    imgEditarSistema: TImage;
    imgExcluirSistema: TImage;
    procedure imgExcluirSistemaMouseEnter(Sender: TObject);
    procedure imgExcluirSistemaMouseLeave(Sender: TObject);
    procedure imgEditarSistemaMouseEnter(Sender: TObject);
    procedure imgEditarSistemaMouseLeave(Sender: TObject);
    procedure imgViewSistemaMouseEnter(Sender: TObject);
    procedure imgViewSistemaMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}



procedure TFListSistema.imgEditarSistemaMouseEnter(Sender: TObject);
begin
    rtEditarSistema.Fill.Kind  := TBrushKind.Solid;
    rtEditarSistema.Fill.Color := TAlphaColors.Dodgerblue;

    imgEditarSistema.Bitmap.LoadFromFile('..\..\src\assets\icons8_Pencil_16-white.png');
end;

procedure TFListSistema.imgEditarSistemaMouseLeave(Sender: TObject);
begin
    imgEditarSistema.Bitmap.LoadFromFile('..\..\src\assets\icons8_Pencil_16.png');
    rtEditarSistema.Fill.Kind := TBrushKind.None;
end;



procedure TFListSistema.imgExcluirSistemaMouseEnter(Sender: TObject);//press
begin
    rtExcluirSistema.Fill.Color := TAlphaColors.Royalblue;
end;

procedure TFListSistema.imgExcluirSistemaMouseLeave(Sender: TObject);
begin
    rtExcluirSistema.Fill.Color := TAlphaColors.Dodgerblue;
end;



procedure TFListSistema.imgViewSistemaMouseEnter(Sender: TObject);
begin
    imgViewSistema.Bitmap.LoadFromFile('..\..\src\assets\icons8_Eye-blue_32.png');

end;

procedure TFListSistema.imgViewSistemaMouseLeave(Sender: TObject);
begin
    imgViewSistema.Bitmap.LoadFromFile('..\..\src\assets\icons8_Eye_32.png');
end;

end.
