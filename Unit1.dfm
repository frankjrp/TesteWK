object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = '[Pedido de Vendas]'
  ClientHeight = 541
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox2: TGroupBox
    Left = 478
    Top = 17
    Width = 421
    Height = 188
    Caption = ' Informe os dados do produto '
    TabOrder = 3
    object Label1: TLabel
      Left = 15
      Top = 26
      Width = 25
      Height = 15
      Caption = '&C'#243'd.'
      FocusControl = Edit2
    end
    object Label2: TLabel
      Left = 15
      Top = 94
      Width = 36
      Height = 15
      Caption = '&Quant.'
      FocusControl = Edit3
    end
    object Label3: TLabel
      Left = 95
      Top = 94
      Width = 71
      Height = 15
      Caption = '&Valor Unit'#225'rio'
      FocusControl = Edit4
    end
    object Edit2: TEdit
      Left = 14
      Top = 43
      Width = 32
      Height = 23
      MaxLength = 4
      TabOrder = 0
      OnEnter = Edit2Enter
      OnExit = Edit2Exit
      OnKeyPress = Edit2KeyPress
    end
    object Panel3: TPanel
      Left = 52
      Top = 37
      Width = 355
      Height = 33
      BevelInner = bvLowered
      TabOrder = 1
      object DBText2: TDBText
        Left = 11
        Top = 9
        Width = 325
        Height = 17
        DataField = 'descricao'
        DataSource = DataSource3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Edit3: TEdit
      Left = 15
      Top = 110
      Width = 53
      Height = 23
      TabOrder = 2
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 95
      Top = 110
      Width = 93
      Height = 23
      TabOrder = 3
      OnExit = Edit4Exit
      OnKeyPress = Edit4KeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 72
    Top = 245
    Width = 776
    Height = 193
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_prod'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desc_prod'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 450
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'quant'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlr_unit'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlr_total'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 75
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 735
    Top = 444
    Width = 113
    Height = 30
    BevelOuter = bvLowered
    Caption = 'R$ 4.299,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 17
    Width = 421
    Height = 80
    Caption = ' Informe o c'#243'digo do cliente '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Edit1: TEdit
      Left = 14
      Top = 37
      Width = 32
      Height = 21
      MaxLength = 4
      TabOrder = 0
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Panel2: TPanel
      Left = 52
      Top = 32
      Width = 355
      Height = 33
      BevelInner = bvLowered
      TabOrder = 1
      object DBText1: TDBText
        Left = 11
        Top = 8
        Width = 325
        Height = 17
        DataField = 'nome'
        DataSource = DataSource2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Button1: TButton
    Left = 813
    Top = 166
    Width = 75
    Height = 25
    Caption = '&Inserir'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 358
    Top = 501
    Width = 94
    Height = 25
    Caption = '&Gravar pedido'
    TabOrder = 5
    OnClick = Button2Click
  end
  object GroupBox3: TGroupBox
    Left = 17
    Top = 117
    Width = 192
    Height = 95
    TabOrder = 6
    object Button3: TButton
      Left = 14
      Top = 16
      Width = 163
      Height = 25
      Caption = 'Carregar &pedidos gravados'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 14
      Top = 54
      Width = 163
      Height = 25
      Caption = 'Cancela&r pedido'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object Button5: TButton
    Left = 486
    Top = 501
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 7
    OnClick = Button5Click
  end
  object DataSource1: TDataSource
    DataSet = dmDados.queryPedidoTemp
    Left = 264
    Top = 296
  end
  object DataSource2: TDataSource
    DataSet = dmDados.queryClientes
    Left = 335
    Top = 296
  end
  object DataSource3: TDataSource
    DataSet = dmDados.queryProdutos
    Left = 406
    Top = 296
  end
end
