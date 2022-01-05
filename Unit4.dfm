object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pedido [Cancelar]'
  ClientHeight = 178
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 14
    Top = 17
    Width = 209
    Height = 105
    Caption = ' Informe o n'#250'mero do pedido '
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 32
      Width = 35
      Height = 23
      MaxLength = 5
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
  end
  object Button1: TButton
    Left = 133
    Top = 87
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 145
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
