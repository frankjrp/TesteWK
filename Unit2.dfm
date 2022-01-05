object dmDados: TdmDados
  Height = 309
  Width = 454
  PixelsPerInch = 96
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=db'
      'User_Name=root'
      'Port='
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 208
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 88
  end
  object queryPedidoTemp: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 40
    Top = 168
    object queryPedidoTempid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object queryPedidoTempcod_prod: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'cod_prod'
      Origin = 'cod_prod'
    end
    object queryPedidoTempdesc_prod: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'desc_prod'
      Origin = 'desc_prod'
      Size = 255
    end
    object queryPedidoTempquant: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quant.'
      FieldName = 'quant'
      Origin = 'quant'
    end
    object queryPedidoTempvlr_unit: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Vlr. Unit.'
      FieldName = 'vlr_unit'
      Origin = 'vlr_unit'
      DisplayFormat = '###,###0.00'
      Precision = 10
      Size = 2
    end
    object queryPedidoTempvlr_total: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Vlr. Total'
      FieldName = 'vlr_total'
      Origin = 'vlr_total'
      DisplayFormat = '###,###0.00'
      Precision = 10
      Size = 2
    end
  end
  object queryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 136
    Top = 168
    object queryClientescodigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object queryClientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object queryClientescidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 255
    end
    object queryClientesUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object queryProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 224
    Top = 168
    object queryProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object queryProdutoscodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      Required = True
    end
    object queryProdutosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object queryProdutospreco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Precision = 10
      Size = 2
    end
  end
  object queryPedidoDadosGerais: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 339
    Top = 168
  end
  object queryPedidoProdutos: TFDQuery
    Connection = FDConnection1
    Left = 48
    Top = 248
    object queryPedidoProdutosprod: TFDAutoIncField
      FieldName = 'prod'
      Origin = 'prod'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object queryPedidoProdutosnum_pedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num_pedido'
      Origin = 'num_pedido'
    end
    object queryPedidoProdutoscod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
    end
    object queryPedidoProdutosquant: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quant'
      Origin = 'quant'
    end
    object queryPedidoProdutosvlr_unit: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_unit'
      Origin = 'vlr_unit'
      DisplayFormat = '###,###0.00'
      Precision = 10
      Size = 2
    end
    object queryPedidoProdutosvlr_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_total'
      Origin = 'vlr_total'
      DisplayFormat = '###,###0.00'
      Precision = 10
      Size = 2
    end
    object queryPedidoProdutosdt_emissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_emissao'
      Origin = 'dt_emissao'
      ProviderFlags = []
      ReadOnly = True
    end
    object queryPedidoProdutosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object queryPedidoProdutosnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object queryPedidoProdutoscod_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
    end
    object queryPedidoProdutosvlr_total_1: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_total_1'
      Origin = 'vlr_total'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###,###0.00'
      Precision = 10
      Size = 2
    end
  end
end
