object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Observa'#231#227'o'
  ClientHeight = 272
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 367
    Height = 19
    Caption = 'Deseja adicionar uma observa'#231#227'o ao pedido?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bitContinuar: TBitBtn
    Left = 232
    Top = 208
    Width = 151
    Height = 46
    Caption = 'Continuar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkYes
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
    OnClick = bitContinuarClick
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 208
    Width = 151
    Height = 46
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object memoDescricao: TMemo
    Left = 8
    Top = 33
    Width = 375
    Height = 169
    CharCase = ecUpperCase
    Lines.Strings = (
      '')
    TabOrder = 2
  end
end
