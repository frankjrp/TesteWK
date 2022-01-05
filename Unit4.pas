unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure validaPedido;
    procedure verificaPedido;
    procedure excluiPedidoDadosGerais;
    procedure excluiPedidoProdutos;
  public
    { Public declarations }
    campoPendente:boolean;
    numPedido:integer;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit2;

procedure TForm4.Button1Click(Sender: TObject);
begin
validaPedido;

if campoPendente = false then verificaPedido;

end;

procedure TForm4.Button2Click(Sender: TObject);
begin
form4.Close;
end;

procedure TForm4.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
form1.digitaNumeros(key);

if edit1.Text = '' then form1.colocaFoco(button2, key)
else form1.colocaFoco(button1, key);
end;

procedure TForm4.excluiPedidoDadosGerais;
begin
dmDados.FDConnection1.ExecSQL('delete from Pedido_dados_gerais where num_pedido = :pedido', [numPedido]);
end;

procedure TForm4.excluiPedidoProdutos;
begin
dmDados.FDConnection1.ExecSQL('delete from Pedido_produtos where num_pedido = :pedido', [numPedido]);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.Edit1.SetFocus;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm4.validaPedido;
begin
campoPendente:=false;

if edit1.Text = '' then begin
application.MessageBox('Informe o número do pedido.', 'Atenção!', mb_iconinformation);
campoPendente:=true;
edit1.SetFocus;
end;
end;

procedure TForm4.verificaPedido;
begin
numPedido:=strtoint(edit1.Text);

dmDados.queryPedidoDadosGerais.SQL.Clear;
dmDados.queryPedidoDadosGerais.Close;
dmDados.queryPedidoDadosGerais.SQL.Text:= 'SELECT * FROM Pedido_dados_gerais ' +
'WHERE num_pedido = :num';
dmDados.queryPedidoDadosGerais.ParamByName('num').AsInteger:= numPedido;
dmDados.queryPedidoDadosGerais.Open;

if dmDados.queryPedidoDadosGerais.IsEmpty then begin
application.MessageBox('Pedido não cadastrado.', 'Atenção!', mb_iconinformation);
edit1.SetFocus;
end else if application.MessageBox(Pchar('Confirma a exclusão do pedido ' + '"' + inttostr(numPedido) + '"' + '?'),'[EXCLUSÃO]',mb_yesno+mb_defbutton2+mb_iconquestion)=idyes then begin
excluiPedidoProdutos;
excluiPedidoDadosGerais;
application.MessageBox(PChar('Pedido ' + inttostr(numPedido) + ' excluído com sucesso!'), '[EXCLUSÃO]', mb_iconinformation);
form4.Close;
end else edit1.SetFocus;

end;

end.
