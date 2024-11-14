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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
