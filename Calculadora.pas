unit Calculadora;

interface

uses // aqui se declara as extens�es que o sistema utiliza, muitas vezes s�o declaradas automaticamente
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCalculadora = class(TForm)
  // Form � o formul�rio, a parte gr�fica da c�lculadora
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
    // procedimentos, fun��es e vari�veis que s�o privadas (acesso somente nesta unity)
    Valor1: currency; //vari�vel para armazenar o primeiro n�mero
    Valor2: currency; //vari�vel para armazenar o segundo n�mero
    Operacao: integer; //variavel para armazenar o tipo de opera��o
    procedure calcular; // Declara��o do procedimento de calcular
  public
    // procedimentos, fun��oes e var�veis que s�o p�blicas (acesso pode ser realizado de fora)
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

procedure TfrmCalculadora.btn0Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '0';
  // adiciona o n�mero 0
end;

procedure TfrmCalculadora.btn1Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '1';
  // adiciona o n�mero 1
end;

procedure TfrmCalculadora.btn2Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '2';
  // adiciona o n�mero 2
end;

procedure TfrmCalculadora.btn3Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '3';
  // adiciona o n�mero 3
end;

procedure TfrmCalculadora.btn4Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '4';
  // adiciona o n�mero 4
end;

procedure TfrmCalculadora.btn5Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '5';
  // adiciona o n�mero 5
end;

procedure TfrmCalculadora.btn6Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '6';
  // adiciona o n�mero 6
end;

procedure TfrmCalculadora.btn7Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '7';
  // adiciona o n�mero 7
end;

procedure TfrmCalculadora.btn8Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '8';
  // adiciona o n�mero 8
end;

procedure TfrmCalculadora.btn9Click(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + '9';
  // adiciona o n�mero 9
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
  // Apaga o c�lculo completo
end;

procedure TfrmCalculadora.btnDivididoClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso n�o exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a vari�vel com o n�mero apresentado
  edtCalculo.Text := '';
  Operacao := 2;
end;

procedure TfrmCalculadora.btnMaisClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso n�o exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a vari�vel com o n�mero apresentado
  edtCalculo.Text := '';
  Operacao := 4;
end;

procedure TfrmCalculadora.btnMenosClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso n�o exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a vari�vel com o n�mero apresentado
  edtCalculo.Text := '';
  Operacao := 3;
end;

procedure TfrmCalculadora.btnVezesClick(Sender: TObject);
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso n�o exista, atribui 0
    valor1 := 0
  else
    valor1 := StrToCurr(edtCalculo.Text); // valoriza a vari�vel com o n�mero apresentado
  edtCalculo.Text := '';
  Operacao := 1;
end;

procedure TfrmCalculadora.btnVirgulaClick(Sender: TObject);
begin
  edtCalculo.Text := edtCalculo.Text + ',';
  //Adiciona v�rgula
end;

procedure TfrmCalculadora.Calcular;
begin
  if edtCalculo.Text = '' then //verifica se possui algum valor na tela, caso n�o exista, atribui 0
    valor2 := 0
  else
    valor2 := StrToCurr(edtCalculo.Text);

  case Operacao of
    1:
    begin
      edtCalculo.Text := CurrToStr(Valor1 * Valor2); //executa a multiplica��o e limpa as vari�veis
      valor1 := Valor1 * Valor2; // define o resultado como valor1
      valor2 := 0;
      Operacao := 0;
    end;

    2:
    begin
      if (valor1 = 0) and (valor2 = 0) then //verifica se a divis�o n�o � de zero por zero
        edtCalculo.Text := ''
      else
      begin
        edtCalculo.Text := CurrToStr(Valor1 / Valor2); //executa a divis�o e limpa as vari�veis
        valor1 := Valor1 / Valor2; // define o resultado como valor1
        valor2 := 0;
      end;
      Operacao := 0;
    end;

    3:
    begin
      edtCalculo.Text := CurrToStr(Valor1 - Valor2); //executa a subtra��o e limpa as vari�veis
      valor1 := Valor1 - Valor2;// define o resultado como valor1
      valor2 := 0;
      Operacao := 0;
    end;

    4:
    begin
      edtCalculo.Text := CurrToStr(Valor1 + Valor2); //executa a adi��o e limpa as vari�veis
      valor1 := Valor1 + Valor2;// define o resultado como valor1
      valor2 := 0;
      Operacao := 0;
    end;
  end;
end;

//este procedimento ocorre ao iniciar o formul�rio, respons�vel por iniciar as vari�veis zeradas
procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
  Valor1 := 0;// define o resultado como valor1
  Valor2 := 0;
  Operacao := 0;
end;

{ Observa��o: A vari�vel "Operacao" ir� ser valorizada conforme apertar os bot�es
de opera��es poss�veis, dependendo a opera��o, ele recebe um valor, sendo estes:
1 - multiplica��o
2 - divis�o
3 - subtra��o
4 - adi��o }


//Qualquer d�vida pode me chamar via whatsapp.
end.
