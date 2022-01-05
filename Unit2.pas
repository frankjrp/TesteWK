unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TdmDados = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    queryPedidoTemp: TFDQuery;
    queryPedidoTempcod_prod: TIntegerField;
    queryPedidoTempdesc_prod: TStringField;
    queryPedidoTempquant: TIntegerField;
    queryPedidoTempvlr_unit: TBCDField;
    queryPedidoTempvlr_total: TBCDField;
    queryPedidoTempid: TFDAutoIncField;
    queryClientes: TFDQuery;
    queryClientescodigo: TIntegerField;
    queryClientesnome: TStringField;
    queryClientescidade: TStringField;
    queryClientesUF: TStringField;
    queryProdutos: TFDQuery;
    queryProdutosid: TFDAutoIncField;
    queryProdutoscodigo: TIntegerField;
    queryProdutosdescricao: TStringField;
    queryProdutospreco_venda: TBCDField;
    queryPedidoDadosGerais: TFDQuery;
    queryPedidoProdutos: TFDQuery;
    queryPedidoProdutosprod: TFDAutoIncField;
    queryPedidoProdutosnum_pedido: TIntegerField;
    queryPedidoProdutoscod_produto: TIntegerField;
    queryPedidoProdutosquant: TIntegerField;
    queryPedidoProdutosvlr_unit: TBCDField;
    queryPedidoProdutosvlr_total: TBCDField;
    queryPedidoProdutosdt_emissao: TDateField;
    queryPedidoProdutosdescricao: TStringField;
    queryPedidoProdutosnome: TStringField;
    queryPedidoProdutoscod_cliente: TIntegerField;
    queryPedidoProdutosvlr_total_1: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
