unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    lblRs: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblValorProduto: TLabel;
    Image1: TImage;
    ImageList1: TImageList;
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Form1.edtValorProduto.Text := lblValorProduto.Caption;
  Form1.edtDescricao.Text := ListBox1.Items.Strings[ListBox1.ItemIndex];
  Form1.edtQuantidadeProduto.Text := '1';
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var bmp : TBitMap;
begin
    bmp := TBitMap.Create;

    if ListBox1.ItemIndex = 0 then
    begin
      lblValorProduto.Caption := '35,00';
      ImageList1.GetBitmap(0, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;
    if ListBox1.ItemIndex = 1 then
    begin
      lblValorProduto.Caption := '45,00';
      ImageList1.GetBitmap(1, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;
      if ListBox1.ItemIndex = 2 then
    begin
      lblValorProduto.Caption := '46,50';
      ImageList1.GetBitmap(2, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;
      if ListBox1.ItemIndex = 3 then
    begin
      lblValorProduto.Caption := '42,50';
      ImageList1.GetBitmap(3, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;
    if ListBox1.ItemIndex = 4 then
    begin
      lblValorProduto.Caption := '55,90';
      ImageList1.GetBitmap(4, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;
    if ListBox1.ItemIndex = 5 then
    begin
      lblValorProduto.Caption := '4,50';
      ImageList1.GetBitmap(5, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;
    if ListBox1.ItemIndex = 6 then
    begin
      lblValorProduto.Caption := '7,50';
      ImageList1.GetBitmap(6, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;
    if ListBox1.ItemIndex = 7 then
    begin
      lblValorProduto.Caption := '3,00';
      ImageList1.GetBitmap(7, bmp);
      Image1.Picture.Bitmap.Assign(bmp);
      Image1.Refresh;
    end;

end;

end.
