unit Calculadora;

interface

uses // aqui se declara as extensões que o sistema utiliza, muitas vezes são declaradas automaticamente
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCalculadora = class(TForm)
  // Form é o formulário, a parte gráfica da cálculadora
    pnlFundo: TPanel;
    btn4: TSpeedButton;
    btn9: TSpeedButton;
    btn6: TSpeedButton;
    btn8: TSpeedButton;
    btn5: TSpeedButton;
    btn2: TSpeedButton;
    btn0: TSpeedButton;
    btn3: TSpeedButton;
    btn7: TSpeedButton;
    edtCalculo: TEdit;
    btn1: TSpeedButton;
    btnMais: TSpeedButton;
    btnMenos: TSpeedButton;
    btnDividido: TSpeedButton;
    btnVezes: TSpeedButton;
    btnDeletarTudo: TSpeedButton;
    btnCalcular: TSpeedButton;
    btnVirgula: TSpeedButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn0Click(Sender: TObject);
    procedure btnMaisClick(Sender: TObject);
    procedure btnMenosClick(Sender: TObject);
    procedure btnDivididoClick(Sender: TObject);
    procedure btnVezesClick(Sender: TObject);
    procedure btnDeletarTudoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnVirgulaClick(Sender: TObject);
  private
    // procedimentos, funções e variáveis que são privadas (acesso somente nesta unity)
    Valor1: currency; //variável para armazenar o primeiro número
    Valor2: currency; //variável para armazenar o segundo número
    Operacao: integer; //variavel para armazenar o tipo de operação
    procedure calcular; // Declaração do procedimento de calcular
  public
    // procedimentos, funçõoes e varáveis que são públicas (acesso pode ser realizado de fora)
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

procedure TfrmCalculadora.btn0Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '0';
  // adiciona o número 0
end;

procedure TfrmCalculadora.btn1Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '1';
  // adiciona o número 1
end;

procedure TfrmCalculadora.btn2Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '2';
  // adiciona o número 2
end;

procedure TfrmCalculadora.btn3Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '3';
  // adiciona o número 3
end;

procedure TfrmCalculadora.btn4Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '4';
  // adiciona o número 4
end;

procedure TfrmCalculadora.btn5Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '5';
  // adiciona o número 5
end;

procedure TfrmCalculadora.btn6Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '6';
  // adiciona o número 6
end;

procedure TfrmCalculadora.btn7Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '7';
  // adiciona o número 7
end;

procedure TfrmCalculadora.btn8Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '8';
  // adiciona o número 8
end;

procedure TfrmCalculadora.btn9Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '9';
  // adiciona o número 9
end;

procedure TfrmCalculadora.btnCalcularClick(Sender: TObject);
begin
  Calcular; //executa o procedimento de calcular
end;

procedure TfrmCalculadora.btnDeletarTudoClick(Sender: TObject);
begin
  edtCalculo.Text := '';
  valor1 := 0;
  valor2 := 0;
  Operacao := 0;
  // Apaga o cálculo completo
end;

procedure TfrmCalculadora.btnDivididoClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso não exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a variável com o número apresentado
  edtCalculo.Text := '';
  Operacao := 2;
end;

procedure TfrmCalculadora.btnMaisClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso não exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a variável com o número apresentado
  edtCalculo.Text := '';
  Operacao := 4;
end;

procedure TfrmCalculadora.btnMenosClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso não exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a variável com o número apresentado
  edtCalculo.Text := '';
  Operacao := 3;
end;

procedure TfrmCalculadora.btnVezesClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso não exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a variável com o número apresentado
  edtCalculo.Text := '';
  Operacao := 1;
end;

procedure TfrmCalculadora.btnVirgulaClick(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + ',';
  //Adiciona vírgula
end;

procedure TfrmCalculadora.Calcular;
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso não exista, atribui 0
    valor2 := 0
  else
    valor2 := StrToCurr(edtCalculo.Text);

  case Operacao of
    1:
    begin
      edtCalculo.Text := CurrToStr(Valor1 * Valor2); //executa a multiplicação e limpa as variáveis
      valor1 := Valor1 * Valor2; // define o resultado como valor1
      valor2 := 0;
      Operacao := 0;
    end;

    2:
    begin
      if (valor1 = 0) and (valor2 = 0) then //verifica se a divisão não é de zero por zero
        edtCalculo.Text := ''
      else
      begin
        edtCalculo.Text := CurrToStr(Valor1 / Valor2); //executa a divisão e limpa as variáveis
        valor1 := Valor1 / Valor2; // define o resultado como valor1
        valor2 := 0;
      end;
      Operacao := 0;
    end;

    3:
    begin
      edtCalculo.Text := CurrToStr(Valor1 - Valor2); //executa a subtração e limpa as variáveis
      valor1 := Valor1 - Valor2;// define o resultado como valor1
      valor2 := 0;
      Operacao := 0;
    end;

    4:
    begin
      edtCalculo.Text := CurrToStr(Valor1 + Valor2); //executa a adição e limpa as variáveis
      valor1 := Valor1 + Valor2;// define o resultado como valor1
      valor2 := 0;
      Operacao := 0;
    end;
  end;
end;

//este procedimento ocorre ao iniciar o formulário, responsável por iniciar as variáveis zeradas
procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
  Valor1 := 0;// define o resultado como valor1
  Valor2 := 0;
  Operacao := 0;
end;

{ Observação: A variável "Operacao" irá ser valorizada conforme apertar os botões
de operações possíveis, dependendo a operação, ele recebe um valor, sendo estes:
1 - multiplicação
2 - divisão
3 - subtração
4 - adição }


//Qualquer dúvida pode me chamar via whatsapp.
end.
