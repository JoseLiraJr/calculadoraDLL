program Calculadora;

uses
  Vcl.Forms,
  uPrincipal in 'view\uPrincipal.pas' {frmPrincipal},
  uSobre in 'view\uSobre.pas' {frmSobre},
  uVisualControls in 'utils\uVisualControls.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Calculadora Numérica';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
