unit uVisualControls;

interface

uses
  System.SysUtils, Vcl.StdCtrls;

type
  TVisualControls = class
    //Implementei Class functions e procedures para não precisar instanciar a classe a cada uso.
    class function CharNumbers(Key : Char) : Boolean;
    class procedure ClearEdit(edt : TEdit; strText : string = '0');
  end;

implementation

{ TVisualControls }

class function TVisualControls.CharNumbers(Key: Char): Boolean;
begin
  Result := True;
  if not(CharInSet(Key,['0'..'9',#8])) then
   Result := False;
end;

class procedure TVisualControls.ClearEdit(edt: TEdit; strText : string = '0');
begin
  edt.Text := strText;
end;

end.
