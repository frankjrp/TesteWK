unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button2: TButton;
    GroupBox2: TGroupBox;
    DBText1: TDBText;
    GroupBox3: TGroupBox;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
    procedure classificaGrid(Column: TColumn);

    procedure listaProdutos;
    procedure exibeVazio;
    procedure validaPedido;
  public
    { Public declarations }
    var
    campoPendente:boolean;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit2, Unit1;

procedure TForm3.Button1Click(Sender: TObject);
begin
validaPedido;

if campoPendente = false then begin
listaProdutos;
end;
edit1.SetFocus;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form3.Close;
end;

procedure TForm3.classificaGrid(Column: TColumn);
begin
if dmDados.queryPedidoProdutos.IndexFieldNames = Column.FieldName then
dmDados.queryPedidoProdutos.IndexFieldNames := Column.FieldName + ':D'
else
dmDados.queryPedidoProdutos.IndexFieldNames := Column.FieldName;
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
begin
classificaGrid(column);
end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
form1.digitaNumeros(key);
if edit1.Text = '' then form1.colocaFoco(button2, key)
else form1.colocaFoco(button1, key);
end;

procedure TForm3.exibeVazio;
begin
dmDados.queryPedidoProdutos.SQL.Clear;
dmDados.queryPedidoProdutos.Close;
dmDados.queryPedidoProdutos.SQL.Text:= 'SELECT Pedido_dados_gerais.*, ' +
'Pedido_produtos.*, ' +
'Clientes.nome, ' +
'Produtos.descricao ' +
'FROM Pedido_Dados_Gerais ' +
'LEFT JOIN Pedido_produtos ON (Pedido_dados_gerais.num_pedido = Pedido_produtos.num_pedido) ' +
'LEFT JOIN Clientes ON (Clientes.codigo = Pedido_dados_gerais.cod_cliente) ' +
'LEFT JOIN Produtos ON (Produtos.codigo = Pedido_produtos.cod_produto) ' +
'WHERE Pedido_dados_gerais.num_pedido = :num';
dmDados.queryPedidoProdutos.ParamByName('num').AsInteger:= 00;
dmDados.queryPedidoProdutos.Open;

panel1.Caption:='R$ 0,00';
end;

procedure TForm3.FormShow(Sender: TObject);
begin
exibeVazio;
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm3.listaProdutos;
begin
dmDados.queryPedidoProdutos.SQL.Clear;
dmDados.queryPedidoProdutos.Close;
dmDados.queryPedidoProdutos.SQL.Text:= 'SELECT Pedido_dados_gerais.*, ' +
'Pedido_produtos.*, ' +
'Clientes.nome, ' +
'Produtos.descricao ' +
'FROM Pedido_Dados_Gerais ' +
'LEFT JOIN Pedido_produtos ON (Pedido_dados_gerais.num_pedido = Pedido_produtos.num_pedido) ' +
'LEFT JOIN Clientes ON (Clientes.codigo = Pedido_dados_gerais.cod_cliente) ' +
'LEFT JOIN Produtos ON (Produtos.codigo = Pedido_produtos.cod_produto) ' +
'WHERE Pedido_dados_gerais.num_pedido = :num';
dmDados.queryPedidoProdutos.ParamByName('num').AsInteger:= strtoint(edit1.Text);
dmDados.queryPedidoProdutos.Open;

if dmDados.queryPedidoProdutos.IsEmpty then begin
panel1.Caption:='R$ 0,00';
application.MessageBox('Pedido não cadastrado.', 'Atenção!', mb_iconinformation);
edit1.SetFocus;
end else panel1.Caption:='R$ ' + formatfloat('###,###0.00', dmDados.queryPedidoProdutos['vlr_total']);
end;

procedure TForm3.validaPedido;
begin
campoPendente:= false;

if edit1.Text = '' then begin
exibeVazio;
application.MessageBox('Informe o número do pedido.', 'Atenção!', mb_iconinformation);
edit1.SetFocus;
campoPendente:= true;
end;
end;

end.
