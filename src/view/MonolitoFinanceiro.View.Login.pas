unit MonolitoFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    pnlEsquerda: TPanel;
    Image1: TImage;
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    lblNameAplicacao: TLabel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtLogin: TEdit;
    lblUsuario: TLabel;
    Panel4: TPanel;
    lblSenha: TLabel;
    edtSenha: TEdit;
    Panel5: TPanel;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel5MouseEnter(Sender: TObject);
    procedure Panel5MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Usuario, MonolitoFinanceiro.Model.Sistema;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  MyClass: TComponent;
begin
  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('Informe o seu usu�rio.', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe o sua senha.', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  try
    dmUsuarios.EfetuarLogin(Trim(edtLogin.Text), Trim(edtSenha.Text));
    dmSistema.DataUltimoAcesso(Now);
    dmSistema.UsuarioUltimoAcesso(dmUsuarios.GetUsuarioLogado.Login);
    ModalResult := mrOK;
  except
    on Erro: Exception do
    begin
      Application.MessageBox(PWideChar(Erro.Message), 'Aten��o', MB_OK + MB_ICONWARNING);
      edtLogin.SetFocus;
    end;
  end;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtLogin.Text := dmSistema.UsuarioUltimoAcesso;
end;

procedure TfrmLogin.Panel5MouseEnter(Sender: TObject);
begin
  Panel5.Color := clHotLight;
end;

procedure TfrmLogin.Panel5MouseLeave(Sender: TObject);
begin
  Panel5.Color := clHighlight;
end;

end.
