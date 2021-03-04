unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uSobre, uVisualControls;

type
  TipoOperacao = (toNone, toSoma, toSubtracao, toMultiplicacao, toDivisao);

  TfrmPrincipal = class(TForm)
    pnVisor: TPanel;
    pnOperacoes: TPanel;
    btnSomar: TSpeedButton;
    btnSubtrair: TSpeedButton;
    btnIgual: TSpeedButton;
    btnSobre: TSpeedButton;
    btnMultiplicar: TSpeedButton;
    btnDividir: TSpeedButton;
    btnLimpaTela: TSpeedButton;
    btnSair: TSpeedButton;
    edtNumeros: TEdit;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnSobreClick(Sender: TObject);
    procedure edtNumerosKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaTelaClick(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
  private
    { Private declarations }
    Valor1, Valor2 : Integer;
    VlrDigitado : string;
    Operacao : TipoOperacao;
    function RealizaCalculo(calculoGeral : Boolean = False) : Integer;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

function Somar(num1, num2 : Integer) : Integer; stdcall; external 'Calculadora.dll';
function Subtrair(num1, num2 : Integer) : Integer; stdcall; external 'Calculadora.dll';
function Multiplicar(num1, num2 : Integer) : Integer; stdcall; external 'Calculadora.dll';
function Dividir(num1, num2 : Integer) : Integer; stdcall; external 'Calculadora.dll';

{$R *.dfm}

procedure TfrmPrincipal.btnDividirClick(Sender: TObject);
begin
  Operacao := toDivisao;
  if (Valor1 = 0) then
   begin
    if (VlrDigitado <> '') then
     Valor1 := StrToInt(VlrDigitado)
    else
     Valor1 := 0;
    edtNumeros.Text := edtnumeros.Text + ' / ';
   end
  else
   begin
    if (VlrDigitado <> '') then
     Valor2 := StrToInt(VlrDigitado)
    else
     Valor2 := 0;
    edtNumeros.Text := IntToStr(RealizaCalculo) + ' / ';
   end;

  VlrDigitado := '';
  edtNumeros.SelStart := Length(edtNumeros.Text);
end;

procedure TfrmPrincipal.btnIgualClick(Sender: TObject);
var
  vlrOperacao : Integer;
begin
  vlrOperacao := RealizaCalculo(True);
  TVisualControls.ClearEdit(edtNumeros, IntToStr(vlrOperacao));
  edtNumeros.SelStart := Length(edtNumeros.Text);
end;

procedure TfrmPrincipal.btnLimpaTelaClick(Sender: TObject);
begin
  TVisualControls.ClearEdit(edtNumeros);
  edtNumeros.SelectAll;
  Valor1 := 0;
  Valor2 := 0;
end;

procedure TfrmPrincipal.btnMultiplicarClick(Sender: TObject);
begin
  Operacao := toMultiplicacao;
  if (Valor1 = 0) then
   begin
    if (VlrDigitado <> '') then
     Valor1 := StrToInt(VlrDigitado)
    else
     Valor1 := 0;
    edtNumeros.Text := edtnumeros.Text + ' x ';
   end
  else
   begin
    if (VlrDigitado <> '') then
     Valor2 := StrToInt(VlrDigitado)
    else
     Valor2 := 0;
    edtNumeros.Text := IntToStr(RealizaCalculo) + ' x ';
   end;

  VlrDigitado := '';
  edtNumeros.SelStart := Length(edtNumeros.Text);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnSobreClick(Sender: TObject);
var
  frmSobre : TfrmSobre;
begin
  frmSobre := TfrmSobre.Create(Self);
  try
    frmSobre.ShowModal;
  finally
    FreeAndNil(frmSobre);
  end;
end;

procedure TfrmPrincipal.btnSomarClick(Sender: TObject);
begin
  Operacao := toSoma;
  if (Valor1 = 0) then
   begin
    if (VlrDigitado <> '') then
     Valor1 := StrToInt(VlrDigitado)
    else
     Valor1 := 0;
    edtNumeros.Text := edtnumeros.Text + ' + ';
   end
  else
   begin
    if (VlrDigitado <> '') then
     Valor2 := StrToInt(VlrDigitado)
    else
     Valor2 := 0;
    edtNumeros.Text := IntToStr(RealizaCalculo) + ' + ';
   end;

  VlrDigitado := '';
  edtNumeros.SelStart := Length(edtNumeros.Text);
end;

procedure TfrmPrincipal.btnSubtrairClick(Sender: TObject);
begin
  Operacao := toSubtracao;
  if (Valor1 = 0) then
   begin
    if (VlrDigitado <> '') then
     Valor1 := StrToInt(VlrDigitado)
    else
     Valor1 := 0;
    edtNumeros.Text := edtnumeros.Text + ' - ';
   end
  else
   begin
    if (VlrDigitado <> '') then
     Valor2 := StrToInt(VlrDigitado)
    else
     Valor2 := 0;
    edtNumeros.Text := IntToStr(RealizaCalculo) + ' - ';
   end;

  VlrDigitado := '';
  edtNumeros.SelStart := Length(edtNumeros.Text);
end;

procedure TfrmPrincipal.edtNumerosKeyPress(Sender: TObject; var Key: Char);
begin
  if not(TVisualControls.CharNumbers(Key)) then
   Key := #0
  else
   VlrDigitado := VlrDigitado + Key;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Application.MessageBox('Deseja Realmente sair do Sistema?', 'Encerrar Aplicação', MB_YESNO + MB_ICONQUESTION) = mrYes) then
    Action := caFree
  else
    Action := caNone;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  VlrDigitado := '';
  Valor1 := 0;
  Valor2 := 0;
  Operacao := toNone;
end;

function TfrmPrincipal.RealizaCalculo(calculoGeral : Boolean = False) : Integer;
var
  vlrEquacao : Integer;
begin
  vlrEquacao := 0;

  if (calculoGeral) then
   begin
     if (valor2 = 0) and (VlrDigitado <> '') then
      Valor2 := StrToInt(VlrDigitado);
   end;

  case operacao of
    toNone:
      raise Exception.Create('Operação de cálculo não definida!');
    toSoma:
      vlrEquacao := Somar(Valor1, Valor2);
    toSubtracao:
      vlrEquacao := Subtrair(Valor1, Valor2);
    toMultiplicacao:
      vlrEquacao := Multiplicar(Valor1, Valor2);
    toDivisao:
      begin
       if (Valor1 = 0) or (valor2 = 0) then
         raise Exception.Create('Não é possível realizar divisão por Zero!');
       vlrEquacao := Dividir(Valor1, Valor2);
      end;
  end;

  Result := vlrEquacao;

  Valor1 := vlrEquacao;
  Valor2 := 0;
  VlrDigitado := '';
end;

end.
