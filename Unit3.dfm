object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedido [Lista de Produtos]'
  ClientHeight = 480
  ClientWidth = 821
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
  object GroupBox1: TGroupBox
    Left = 24
    Top = 24
    Width = 209
    Height = 105
    Caption = ' Informe o n'#250'mero do pedido '
    TabOrder = 3
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
  object DBGrid1: TDBGrid
    Left = 24
    Top = 182
    Width = 776
    Height = 193
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_produto'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Produto'
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
        FieldName = 'descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
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
        Title.Caption = 'Quant.'
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
        Title.Caption = 'Vlr. Unit.'
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
        FieldName = 'vlr_total_1'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total'
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
    Left = 687
    Top = 380
    Width = 113
    Height = 30
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 143
    Top = 94
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 373
    Top = 436
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 264
    Top = 24
    Width = 153
    Height = 64
    Caption = ' Data de emiss'#227'o '
    TabOrder = 5
    object DBText1: TDBText
      Left = 3
      Top = 33
      Width = 147
      Height = 17
      Alignment = taCenter
      DataField = 'dt_emissao'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 448
    Top = 24
    Width = 352
    Height = 64
    Caption = ' Cliente '
    TabOrder = 6
    object DBText2: TDBText
      Left = 18
      Top = 33
      Width = 40
      Height = 17
      DataField = 'cod_cliente'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 51
      Top = 33
      Width = 278
      Height = 17
      DataField = 'nome'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object DataSource1: TDataSource
    DataSet = dmDados.queryPedidoProdutos
    Left = 264
    Top = 240
  end
end
