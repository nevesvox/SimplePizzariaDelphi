unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    edtNumeroItem: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm5.BitBtn2Click(Sender: TObject);
var numeroItem : integer;
begin
  numeroItem := StrToInt(edtNumeroItem.Text);
  Form1.DeletaItemArray(numeroItem);
end;

end.
