unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.Menus;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSource1: TDataSource;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    ToggleStatus: TToggleSwitch;
    lblName: TLabel;
    lblLogin: TLabel;
    lblSenha: TLabel;
    lblStatus: TLabel;
    PopupMenu1: TPopupMenu;
    mnuLimparSenha: TMenuItem;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure mnuLimparSenhaClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Usuario,
MonolitoFinanceiro.Utilitarios,
BCrypt;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);
    Application.MessageBox('Registro exclu�do com sucesso!', 'Aten��o', MB_OK + MB_ICONINFORMATION);
    except on E: Exception do
      Application.MessageBox(PWideChar(E.Message),'Erro ao excluir registro',MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'select * from usuarios';
  dmUsuarios.cdsUsuarios.Open;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
   LStatus : String;
   Mensagem : String;
   LHash : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O Campo nome n�o pode ser vazio', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O Campo login n�o pode ser vazio', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

   if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('O Campo senha n�o pode ser vazio.', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin
    edtSenha.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s j� se encontra cadastrado', [edtLogin.Text])), 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;


  LStatus := 'A';

  if ToggleStatus.State = tssOff then
    LStatus := 'B';

  Mensagem := 'Registro alterado com sucesso!';

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    Mensagem := 'Registro incluido com sucesso!';
    dmUsuarios.cdsUsuariosID.AsString := TUtilitarios.GetId;
    dmUsuarios.cdsUsuariosdata_cadastro.AsDateTime := now;

  end;

  LHash := TBCrypt.GenerateHash(Trim(edtSenha.Text));

  dmUsuarios.cdsUsuariosNome.AsString := Trim(edtNome.Text);
  dmUsuarios.cdsUsuariosLogin.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosSenha.AsString := LHash;
  dmUsuarios.cdsUsuariosStatus.AsString := LStatus;

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);
  Application.MessageBox(PWideChar(Mensagem), 'Aten��o', MB_OK + MB_ICONINFORMATION);

  pnlPrincipal.ActiveCard := CardPesquisa;

  inherited;

end;



procedure TfrmUsuarios.LimparCampos;
var
  Contador : Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
  begin
    if Components[Contador] is TCustomEdit then
      TCustomEdit(Components[Contador]).Clear
    else if Components[Contador]is TToggleSwitch then
      TToggleSwitch(Components[Contador]).State := tsson;
  end;

end;

procedure TfrmUsuarios.mnuLimparSenhaClick(Sender: TObject);
begin
  inherited;
  if not DataSource1.DataSet.IsEmpty then
  begin
    dmUsuarios.LimparSenha(DataSource1.DataSet.FieldByName('ID').AsString);
    Application.MessageBox(PWideChar(format('Foi definida a senha padr�o para o usu�rio "%s"',[DataSource1.DataSet.FieldByName('NOME').AsString ])), 'Aten��o', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Edit;

  edtNome.Text := dmUsuarios.cdsUsuariosNome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuariosLogin.AsString;
  edtSenha.Text := dmUsuarios.cdsUsuariosSenha.AsString;
  ToggleStatus.State := tsson;

  if dmUsuarios.cdsUsuariosStatus.AsString = 'B' then
    ToggleStatus.State := tssoff;

end;

end.
