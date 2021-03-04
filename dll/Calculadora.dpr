library Calculadora;

uses
  System.SysUtils,
  System.Classes;

{$R *.res}

function Somar(num1, num2 : Integer) : Integer stdcall; export;
var
  soma : Integer;
begin
  soma := num1 + num2;
  Result := soma;
end;

function Subtrair(num1, num2 : Integer) : Integer stdcall; export;
var
  subtracao : Integer;
begin
  subtracao := num1 - num2;
  Result := subtracao;
end;

function Multiplicar(num1, num2 : Integer) : Integer stdcall; export;
var
  multiplicacao : Integer;
begin
  multiplicacao := num1 * num2;
  Result := multiplicacao;
end;

function Dividir(num1, num2 : Integer) : Integer stdcall; export;
var
  divisao : Integer;
begin
  divisao := num1 div num2;
  Result := divisao;
end;

Exports
Somar, Subtrair, Multiplicar, Dividir;

begin
end.
