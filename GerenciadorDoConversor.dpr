program GerenciadorDoConversor;

uses
  System.StartUpCopy,
  FMX.Forms,
  uHome in 'src\uHome.pas' {FHome},
  frameListSistema in 'src\frames\frameListSistema.pas' {FListSistema: TFrame},
  uInstanciaConexao in 'src\conexao\uInstanciaConexao.pas',
  uConexao in 'src\conexao\uConexao.pas',
  uSistemasVO in 'src\VO\uSistemasVO.pas',
  uGerenciadorController in 'src\controller\uGerenciadorController.pas',
  frameRadioModulos in 'src\frames\frameRadioModulos.pas' {FRadioModulos: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFHome, FHome);
  Application.Run;
  //ReportMemoryLeaksOnShutdown := True;
end.
