unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    bitConfirmar: TBitBtn;
    comBoxTipoPagamento: TComboBox;
    Label3: TLabel;
    maskEdtCPF: TMaskEdit;
    edtNomeCliente: TEdit;
    Panel1: TPanel;
    memoCupomFiscal: TMemo;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    comBoxQtdParcelas: TComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edtValorRecebido: TEdit;
    lblCaptionTrocoParcela: TLabel;
    lblTrocoParcelas: TLabel;
    Label7: TLabel;
    lblValorTotalPagamento: TLabel;
    Label8: TLabel;
    bitCancelar: TBitBtn;
    GroupBox3: TGroupBox;
    checkComissao: TCheckBox;
    procedure comBoxTipoPagamentoChange(Sender: TObject);
    procedure edtValorRecebidoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure comBoxQtdParcelasChange(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure edtNomeClienteExit(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var textoObservacao : string;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1, Unit3;

// Responsavel por realizar o fechamento da venda e a emiss�o do Cupom Fiscal
procedure TForm4.bitConfirmarClick(Sender: TObject);
var i : integer;
    comissao : double;
begin
  // Verifica o caption do bot�o
  if bitConfirmar.Caption = 'FINALIZAR' then
  begin
    // Chama a fun��o que limpa os campos
    Form1.CancelaVenda();
    // Fecha a view
    Self.Close;
    exit;
  end;
  // Verifica se o Nome do Cliente foi preenchido
  if edtNomeCliente.Text = '' then
  begin
    // Exibe a mensagem
    ShowMessage('Nome do cliente n�o preenchido. Verifique!');
    // Manda o foco para o campo de nome
    edtNomeCliente.SetFocus();
    // Quebra a fun��o
    exit;
  end;
  // Verifica se o campo de Cpf foi preenchido
  if maskEdtCPF.Text = '' then
  begin
    // Exibe a mensagem
    ShowMessage('CPF n�o preenchido. Verifique!');
    // Manda o foco para o campo de cpf
    maskEdtCPF.SetFocus();
    // Quebra a fun��o
    exit;
  end;
  // Verifica se o tipo de pagamento � Dinheiro
  if comBoxTipoPagamento.ItemIndex = 0 then
  begin
    // Verifica se o usuario deu entrada no valor
    if edtValorRecebido.Text = '' then
    begin
      // Exibe a mensagem
      ShowMessage('Valor recebido inv�lido. Verifique!');
      // Manda o foco para o campo de valor
      edtValorRecebido.SetFocus();
      // quebra a fun��o
      exit;
    end;
  end;
  // Verifica se o tipo de pagamento � Credito
  if comBoxTipoPagamento.ItemIndex = 1 then
  begin
    // Verifica se o usuario selecionou a quantidade de parcelas
    if comBoxQtdParcelas.ItemIndex = -1 then
    begin
      // Exibe o alerta
      ShowMessage('Quantidade de Parcelas n�o preenchidas. Verifique!');
      // Manda o foco para o combobox de parcelas
      comBoxQtdParcelas.SetFocus();
      //Quebra a fun��o
      exit;
    end;
  end;

  // Insere os dados da Compra no Memo
  memoCupomFiscal.Lines.Add('PIZZARIA - LA BORDA DE PRATA');
  memoCupomFiscal.Lines.Add('AV. TIRADENTES, 3200, MARILIA-SP');
  memoCupomFiscal.Lines.Add('CNPJ: 14.824.373/0001-91');
  memoCupomFiscal.Lines.Add('--------------------------------------------------------------------');
  memoCupomFiscal.Lines.Add('CPF CONSUMIDOR: '+maskEdtCPF.Text);
  memoCupomFiscal.Lines.Add('NOME: '+edtNomeCliente.Text);
  memoCupomFiscal.Lines.Add('--------------------------------------------------------------------');
  memoCupomFiscal.Lines.Add(DateToStr(Date)+' '+ TimeToStr(Time));
  memoCupomFiscal.Lines.Add('--------------------- CUPOM FISCAL ELETR�NICO ----------------------');
  // Recupera registros do Memo do Form1
  memoCupomFiscal.Lines.Add(Form1.memoVenda.Lines.GetText);
  // Resumo do pagamento
  memoCupomFiscal.Lines.Add('--------------------------------------------------------------------');
  memoCupomFiscal.Lines.Add('TOTAL :                                               R$ '+ lblValorTotalPagamento.Caption);
  memoCupomFiscal.Lines.Add('FORMA DE PAGAMENTO: '+ comBoxTipoPagamento.Text);
  // Verifica se o tipo de pagamento � Cr�dito
  if comBoxTipoPagamento.ItemIndex = 1 then
  begin
    // Insere a quantidade de parcelas
    memoCupomFiscal.Lines.Add('QTDE. PARCELAS: '+ comBoxQtdParcelas.Text+ '  VLR. PARCELAS: '+ lblTrocoParcelas.Caption);
  end;
  // Verifica se foi requisitado o calculo da comiss�o do Gar�om
  if checkComissao.Checked then
  begin
    // Calcula a comiss�o
    comissao := StrToFloat(lblValorTotalPagamento.Caption) * 0.10;
    // Insere a linha de comiss�o
    memoCupomFiscal.Lines.Add('COMISS�O GAR�OM: R$ '+ Formatfloat('##,##0.00', comissao));
  end;
  memoCupomFiscal.Lines.Add('--------------------------------------------------------------------');
  // Recupera a Observa��o do pedido do Form3
  memoCupomFiscal.Lines.Add('OBS. PEDIDO: '+ Form3.memoDescricao.Lines.GetText);
  memoCupomFiscal.Lines.Add('                   OBRIGADO PELA PREFERENCIA!');

  //Bloqueia os campos da view
  edtNomeCliente.Enabled := false;
  edtValorRecebido.Enabled := false;
  comBoxTipoPagamento.Enabled := false;
  comBoxQtdParcelas.Enabled := false;
  checkComissao.Enabled := false;
  maskEdtCPF.Enabled := false;
  bitCancelar.Visible := false;
  // Atualiza o Caption do bot�o
  bitConfirmar.Caption := 'FINALIZAR';
end;

// Responsavel por realizar o calculo das parcelas
procedure TForm4.bitCancelarClick(Sender: TObject);
begin
 Self.Close;
end;

procedure TForm4.comBoxQtdParcelasChange(Sender: TObject);
var valorParcela : double;
begin
  // Verifica a quantidade de parcelas escolhida e realiza o calculo
  if comBoxQtdParcelas.ItemIndex = 0 then
  begin
    valorParcela := StrToFloat(lblValorTotalPagamento.Caption) / 1;
  end;
   if comBoxQtdParcelas.ItemIndex = 1 then
  begin
    valorParcela := StrToFloat(lblValorTotalPagamento.Caption) / 2;
  end;
   if comBoxQtdParcelas.ItemIndex = 2 then
  begin
    valorParcela := StrToFloat(lblValorTotalPagamento.Caption) / 3;
  end;
   if comBoxQtdParcelas.ItemIndex = 3 then
  begin
    valorParcela := StrToFloat(lblValorTotalPagamento.Caption) / 4;
  end;
  // Atualiza o valor da parcelas na tela
  lblTrocoParcelas.Caption := 'R$ '+Formatfloat('##,##0.00', valorParcela);
end;

// Responsavel por verificar qual o Tipo de pagamento escolhido
procedure TForm4.comBoxTipoPagamentoChange(Sender: TObject);
begin
  // Se o pagamento for em Dinheiro
 if comBoxTipoPagamento.ItemIndex = 0 then
  begin
    // Desativa o combobox de parcelas
    comBoxQtdParcelas.Enabled := false;
    // Ativa o edit de valor recebido
    edtValorRecebido.Enabled := true;
    // Atualiza o Label
    lblCaptionTrocoParcela.Caption := '             Troco:';
    // Torna visivel o Label
    lblCaptionTrocoParcela.Visible := true;
    // Torna visivel o Label
    lblTrocoParcelas.Visible := true;
    // Atualiza o Label
    lblTrocoParcelas.Caption := '';
    // Atualiza o Combobox
    comBoxQtdParcelas.ItemIndex := -1;
  end;
  // Se o pagamento for por Cr�dito
  if comBoxTipoPagamento.ItemIndex = 1 then
  begin
    // Ativa o comboBox
    comBoxQtdParcelas.Enabled := true;
    // Desativa o edit de valor Recebido
    edtValorRecebido.Enabled := false;
    // Atualiza o Label
    lblCaptionTrocoParcela.Caption := 'Valor Parcela:';
    // Torna visivel o Label
    lblCaptionTrocoParcela.Visible := true;
    // Torna visivel o Label
    lblTrocoParcelas.Visible := true;
  end;
  // Se o pagamento for D�bito ou Vale
  if (comBoxTipoPagamento.ItemIndex = 2) or (comBoxTipoPagamento.ItemIndex = 3) then
  begin
    // Desativa o comboBox
    comBoxQtdParcelas.Enabled := false;
    // Desativa o edit de valor recebido
    edtValorRecebido.Enabled := false;
    // Torna invisivel o label
    lblCaptionTrocoParcela.Visible := false;
    // Torna invilivel o label
    lblTrocoParcelas.Visible := false;
  end;
end;

procedure TForm4.edtNomeClienteExit(Sender: TObject);
begin
  // Manda o foco para o campo
  maskEdtCPF.SetFocus();
end;

procedure TForm4.edtValorRecebidoExit(Sender: TObject);
var valorRecebido, troco, f : double;
begin
  // V�lida se o usuario entrou com um valor v�lido
  if not TryStrToFloat(edtValorRecebido.Text, f) then
  begin
    // Exibe o alerta
    ShowMessage('Valor inv�lido! Verifique!');
    // Manda o focus para o campo
    edtValorRecebido.SetFocus();
    // Quebra a fun��o
    exit;
  end;
  // Recupera Valor recebido
  valorRecebido := StrToFloat(edtValorRecebido.Text);
  // Verifica se o valor recebido � menor que o valor total da compra
  if valorRecebido < StrToFloat(lblValorTotalPagamento.Caption) then
  begin
    // Exibe a mensagem
    ShowMessage('O valor recebido n�o pode ser menor que o Valor Total');
    // Manda o foco para o campo
    edtValorRecebido.SetFocus();
    // Quebra a fun��o
    exit;
  end;
  // Calcula o troco
  troco := valorRecebido - StrToFloat(lblValorTotalPagamento.Caption);
  // Atualiza o label com o valor do troco
  lblTrocoParcelas.Caption := 'R$ '+Formatfloat('##,##0.00', troco);
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  // Recupera o valor da venda do Form1
  lblValorTotalPagamento.Caption := Form1.lblValorTotal.Caption;
  // Joga o foco para o campo de Nome do Cliente
  edtNomeCliente.SetFocus();
end;

end.
