unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Panel2: TPanel;
    DBText1: TDBText;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    Panel3: TPanel;
    DBText2: TDBText;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure digitaNumeros(var Key: Char);
    procedure formataQuatroDigitos(Campo: TEdit);
    procedure colocaFoco(Obj: TWinControl; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure verificaCliente;
    procedure verificaProduto;
    procedure classificaGrid(Column: TColumn);
    procedure digitaDecimal(Sender: TObject; var Key: Char);
    procedure formataDecimal(Campo: TEdit);
    procedure limpaCampos;
    procedure buscaDados;
    procedure verificaCampos;
    procedure validaCliente;
    procedure exibeOpcoes;

    procedure insereProduto;
    procedure atualizaProduto;
    procedure excluiProduto;
    procedure listaProdutos;
    procedure validaProdutos;
    procedure limpaTabela;

    procedure insereDadosGeraisPedido;
    procedure buscaNumeroPedido;
    procedure inserePedidoProdutos;

  public
  tot:double;
  clickAction, numPedido:integer;
  campoPendente:boolean;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4;

procedure TForm1.atualizaProduto;
var
vlr_unit,total: double;
id: integer;
begin
id:=dmDados.queryPedidoTemp['id'];

vlr_unit := strtofloat(edit4.Text);
total := strtofloat(edit3.Text) * strtofloat(edit4.Text);

dmDados.FDConnection1.ExecSQL(
'update Pedido_temp set quant = :quant, vlr_unit = :vlr_unit, vlr_total = :vlr_total ' +
'where id = :id', [edit3.Text, vlr_unit, total, id]);
end;

procedure TForm1.buscaDados;
begin
edit2.Text:= dmDados.queryPedidoTemp['cod_prod'];
dbtext2.Caption:= dmDados.queryPedidoTemp['desc_prod'];
edit3.Text:= dmDados.queryPedidoTemp['quant'];
edit4.Text:= dmDados.queryPedidoTemp['vlr_unit'];

formataDecimal(edit4);
end;

procedure TForm1.buscaNumeroPedido;
begin
dmDados.queryPedidoDadosGerais.SQL.Clear;
dmDados.queryPedidoDadosGerais.Close;
dmDados.queryPedidoDadosGerais.SQL.Text:= 'SELECT LAST_INSERT_ID()';
dmDados.queryPedidoDadosGerais.Open;

numPedido:= dmDados.queryPedidoDadosGerais['LAST_INSERT_ID()'];
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
verificaCampos;

if campoPendente = false then begin

if clickAction = 0 then begin
insereProduto;
listaProdutos;
limpaCampos;
edit2.SetFocus;
end else begin
atualizaProduto;
listaProdutos;
limpaCampos;
edit2.ReadOnly:=false;
dbgrid1.Enabled:=true;
edit2.SetFocus;
clickAction:= 0;
end;

end;

end;

procedure TForm1.Button2Click(Sender: TObject);

begin
validaCliente;

if campoPendente = false then validaProdutos;

if campoPendente = false then begin
insereDadosGeraisPedido;
buscaNumeroPedido;
inserePedidoProdutos;
limpaTabela;
listaProdutos;

edit1.Text:='';
dbtext1.Caption:='';
application.MessageBox(PChar('Pedido número ' + inttostr(numPedido) + ' gerado com sucesso!'), 'Pedido', mb_iconinformation);
edit1.SetFocus;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
form3.ShowModal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
form4.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.classificaGrid(Column: TColumn);
begin
if dmDados.queryPedidoTemp.IndexFieldNames = Column.FieldName then
dmDados.queryPedidoTemp.IndexFieldNames := Column.FieldName + ':D'
else
dmDados.queryPedidoTemp.IndexFieldNames := Column.FieldName;
end;

procedure TForm1.colocaFoco(Obj: TWinControl; var Key: Char);
begin
if key=#13 then begin
key:=#0;
Obj.SetFocus;
end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_DELETE then excluiProduto;
end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then begin
clickAction:= 1;

buscaDados;
edit2.ReadOnly:=true;
dbgrid1.Enabled:=false;
edit3.SetFocus;
end;

end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
classificaGrid(Column);
end;

procedure TForm1.digitaDecimal(Sender: TObject; var Key: Char);
begin
if not(key in ['0'..'9','.',',',#8,#13]) then key := #0;
if key in ['.'] then key := ',';
if key in [',','.'] then if pos(key,TEdit(Sender).Text) <> 0 then key := #0;
end;

procedure TForm1.digitaNumeros(var Key: Char);
begin
if not(key in ['0'..'9', #8, #13]) then key := #0;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
exibeOpcoes;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
dbtext1.Caption:='';
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if edit1.Text <> Trim('') then begin
formataQuatroDigitos(edit1);
verificaCliente;
end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
digitaNumeros(key);
colocaFoco(edit2, key);
end;

procedure TForm1.Edit2Enter(Sender: TObject);
begin
if edit2.ReadOnly = false then dbtext2.Caption:='';

end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
if edit2.Text <> Trim('') then begin
formataQuatroDigitos(edit2);
verificaProduto;
end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
digitaNumeros(key);
if edit2.Text = '' then colocaFoco(button2, key)
else colocaFoco(edit3, key);
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
digitaNumeros(key);
colocaFoco(edit4, key);
end;

procedure TForm1.Edit4Exit(Sender: TObject);
begin
if edit4.Text <> Trim('') then
formataDecimal(edit4);
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
digitaDecimal(edit4, key);
colocaFoco(button1, key);
end;

procedure TForm1.excluiProduto;
var
id:integer;
desc:string;
vlr_total:string;
begin
id:=dmDados.queryPedidoTemp['id'];
desc:=dmDados.queryPedidoTemp['desc_prod'];
vlr_total:=formatfloat('###,###0.00', dmDados.queryPedidoTemp['vlr_total']);

if application.MessageBox(Pchar('Confirma a exclusão de ' + '"' + desc + '"' + #13 + #13 + 'Valor total R$ ' + vlr_total + '?'),'[EXCLUSÃO]',mb_yesno+mb_defbutton2+mb_iconquestion)=idyes then begin
dmDados.FDConnection1.ExecSQL('delete from Pedido_temp where id = :id', [id]);
listaProdutos;
edit2.SetFocus;
end;
end;

procedure TForm1.exibeOpcoes;
begin
if edit1.Text = '' then groupbox3.Visible:=true else groupbox3.Visible:=false;

end;

procedure TForm1.formataDecimal(Campo: TEdit);
var
v:double;
begin
v:=strtofloat(campo.Text);
campo.Text:=formatfloat('0.00',v);
end;

procedure TForm1.formataQuatroDigitos(Campo: TEdit);
begin
Campo.Text:=formatfloat('####0000',strtofloat(Campo.Text));
end;

procedure TForm1.FormShow(Sender: TObject);
begin
clickAction:=0;
limpaCampos;
edit1.SetFocus;
listaProdutos;
end;

procedure TForm1.insereDadosGeraisPedido;
begin
dmDados.FDConnection1.ExecSQL(
'insert into pedido_dados_gerais(dt_emissao, cod_cliente, vlr_total)' +
'values(:emissao, :cliente, :vlr_total)', [now(), edit1.Text, tot]);
end;

procedure TForm1.inserePedidoProdutos;
begin
dmDados.queryPedidoTemp.First;
while not dmDados.queryPedidoTemp.Eof do begin
dmDados.FDConnection1.ExecSQL(
'insert into Pedido_produtos(num_pedido, cod_produto, quant, vlr_unit, vlr_total)' +
'values(:pedido, :produto, :quant, :vlr_unit, :vlr_total)',
[numPedido, dmDados.queryPedidoTemp['cod_prod'], dmDados.queryPedidoTemp['quant'], dmDados.queryPedidoTemp['vlr_unit'], dmDados.queryPedidoTemp['vlr_total']]);
dmDados.queryPedidoTemp.Next;
end;
end;

procedure TForm1.insereProduto;
var
vlr_unit,total: double;
begin
vlr_unit := strtofloat(edit4.Text);
total := strtofloat(edit3.Text) * strtofloat(edit4.Text);

dmDados.FDConnection1.ExecSQL(
'insert into Pedido_temp(cod_prod, desc_prod, quant, vlr_unit, vlr_total)' +
'values(:cod, :desc, :quant, :vlr_unit, :vlr_total)',
[edit2.Text, dbtext2.Caption, edit3.Text, vlr_unit, total]);
end;

procedure TForm1.limpaCampos;
begin
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
dbtext2.Caption:='';
end;

procedure TForm1.limpaTabela;
begin
dmDados.FDConnection1.ExecSQL('truncate table Pedido_temp');
end;

procedure TForm1.listaProdutos;
begin
dmDados.queryPedidoTemp.SQL.Clear;
dmDados.queryPedidoTemp.Close;
dmDados.queryPedidoTemp.SQL.Text:= 'SELECT * FROM Pedido_temp ORDER BY cod_prod';
dmDados.queryPedidoTemp.Open;

tot:=0;
dmDados.queryPedidoTemp.First;
while not dmDados.queryPedidoTemp.Eof do begin
  tot:= tot + dmDados.queryPedidoTemp['vlr_total'];
  dmDados.queryPedidoTemp.Next;
end;
panel1.Caption:='R$ ' + formatfloat('###,###0.00', tot);
dmDados.queryPedidoTemp.First;
end;

procedure TForm1.validaCliente;
begin
campoPendente:= false;

if edit1.Text = '' then begin
application.MessageBox('Informe o código do cliente.', 'Atenção!', mb_iconinformation);
edit1.SetFocus;
campoPendente:= true;
end;
end;

procedure TForm1.validaProdutos;
begin
campoPendente:= false;

if dmDados.queryPedidoTemp.IsEmpty = true then begin
application.MessageBox('O pedido está vazio. Insira produtos para gerar um pedido.', 'Atenção!', mb_iconinformation);
edit2.SetFocus;
campoPendente:= true;
end;
end;

procedure TForm1.verificaCampos;
begin
campoPendente:= false;

if edit2.Text = '' then begin
application.MessageBox('Informe o código do produto.', 'Atenção!', mb_iconinformation);
edit2.SetFocus;
campoPendente:= true;
end else

if edit3.Text = '' then begin
application.MessageBox('Informe a quantidade.', 'Atenção!', mb_iconinformation);
edit3.SetFocus;
campoPendente:= true;
end else

if edit4.Text = '' then begin
application.MessageBox('Informe o valor do produto.', 'Atenção!', mb_iconinformation);
edit4.SetFocus;
campoPendente:= true;
end;

end;

procedure TForm1.verificaCliente;
begin
dmDados.queryClientes.SQL.Clear;
dmDados.queryClientes.Close;
dmDados.queryClientes.SQL.Text:= 'SELECT * FROM clientes WHERE codigo = :cod';
dmDados.queryClientes.ParamByName('cod').AsInteger:= strtoint(edit1.Text);
dmDados.queryClientes.Open;

if dmDados.queryClientes.IsEmpty then begin
application.MessageBox('Cliente não cadastrado.', 'Atenção!', mb_iconinformation);
edit1.SetFocus;
end;
end;

procedure TForm1.verificaProduto;
begin
dmDados.queryProdutos.SQL.Clear;
dmDados.queryProdutos.Close;
dmDados.queryProdutos.SQL.Text:= 'SELECT * FROM produtos WHERE codigo = :cod';
dmDados.queryProdutos.ParamByName('cod').AsInteger:= strtoint(edit2.Text);
dmDados.queryProdutos.Open;

if dmDados.queryProdutos.IsEmpty then begin
application.MessageBox('Produto não cadastrado.', 'Atenção!', mb_iconinformation);
edit2.SetFocus;
end;
end;

end.
