unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    bitContinuar: TBitBtn;
    BitBtn2: TBitBtn;
    memoDescricao: TMemo;
    procedure bitContinuarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit4;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm3.bitContinuarClick(Sender: TObject);
begin
   // Pega o texto do memo inteiro
   //ShowMessage(memoDescricao.Lines.CommaText);
   Form4.Show;
   Form3.Close;
end;

end.
