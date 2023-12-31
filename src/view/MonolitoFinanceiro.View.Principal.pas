unit MonolitoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastros: TMenuItem;
    mnuRelatorios: TMenuItem;
    nmuAjuda: TMenuItem;
    nmuCadastroPadrao: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Financeiro1: TMenuItem;
    Caixa1: TMenuItem;
    ResumoCaixa1: TMenuItem;
    ContasPagar1: TMenuItem;
    ContasReceber1: TMenuItem;
    procedure nmuUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure ResumoCaixa1Click(Sender: TObject);
    procedure ContasPagar1Click(Sender: TObject);
    procedure ContasReceber1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.View.CadastroPadrao, MonolitoFinanceiro.View.Splash,
  MonolitoFinanceiro.View.Usuarios, MonolitoFinanceiro.View.Login,
  MonolitoFinanceiro.Model.Usuario, MonolitoFinanceiro.View.RedefinirSenha,
  MonolitoFinanceiro.View.Caixa, MonolitoFinanceiro.View.CaixaSaldo,
  MonolitoFinanceiro.View.ContasPagar, MonolitoFinanceiro.View.ContasReceber;

procedure TfrmPrincipal.Caixa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCaixa, frmCaixa);
  frmCaixa.Show;
end;

procedure TfrmPrincipal.ContasPagar1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmContasPagar, frmContasPagar);
  frmContasPagar.Show;
end;

procedure TfrmPrincipal.ContasReceber1Click(Sender: TObject);
begin
  frmContasReceber := TfrmContasReceber.Create(Application);
  frmContasReceber.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin



  StatusBar1.Panels.Items[1].Text := 'Usu�rio: ' + dmUsuarios.GetUsuarioLogado.Nome;
end;

procedure TfrmPrincipal.nmuUsuariosClick(Sender: TObject);
begin
  frmUsuarios := TfrmUsuarios.Create(Application);
  frmUsuarios.Show;
end;

procedure TfrmPrincipal.ResumoCaixa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCaixaSaldo, frmCaixaSaldo);
  frmCaixaSaldo.Show;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
