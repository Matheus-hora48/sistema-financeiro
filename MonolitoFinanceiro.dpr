program MonolitoFinanceiro;

uses
  Vcl.Forms,
  MonolitoFinanceiro.View.Principal in 'src\view\MonolitoFinanceiro.View.Principal.pas' {frmPrincipal},
  MonolitoFinanceiro.View.CadastroPadrao in 'src\view\MonolitoFinanceiro.View.CadastroPadrao.pas' {frmCadastroPadrao},
  MonolitoFinanceiro.View.Splash in 'src\view\MonolitoFinanceiro.View.Splash.pas' {frmSplash},
  MonolitoFinanceiro.Model.Conexao in 'src\model\MonolitoFinanceiro.Model.Conexao.pas' {dmConexao: TDataModule},
  MonolitoFinanceiro.View.Usuarios in 'src\view\MonolitoFinanceiro.View.Usuarios.pas' {frmUsuarios},
  MonolitoFinanceiro.Model.Usuario in 'src\model\MonolitoFinanceiro.Model.Usuario.pas' {dmUsuarios: TDataModule},
  MonolitoFinanceiro.Utilitarios in 'src\util\MonolitoFinanceiro.Utilitarios.pas',
  MonolitoFinanceiro.View.Login in 'src\view\MonolitoFinanceiro.View.Login.pas' {frmLogin},
  MonolitoFinanceiro.Model.Entidade.Usuario in 'src\model\entidades\MonolitoFinanceiro.Model.Entidade.Usuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPadrao, frmCadastroPadrao);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.Run;
end.
