unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls, Vcl.Menus,
  MonolitoFinanceiro.Model.Usuario;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    edtNome: TEdit;
    edtLogin: TEdit;
    ToggleStatus: TToggleSwitch;
    lblName: TLabel;
    lblLogin: TLabel;
    lblStatus: TLabel;
    PopupMenu1: TPopupMenu;
    mnuLimparSenha: TMenuItem;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure mnuLimparSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DM: TdmUsuarios;
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses
MonolitoFinanceiro.Utilitarios,
BCrypt;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
   LStatus : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O Campo nome não pode ser vazio', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O Campo login não pode ser vazio', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin
    edtLogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s já se encontra cadastrado', [edtLogin.Text])), 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;


  LStatus := 'A';

  if ToggleStatus.State = tssOff then
    LStatus := 'B';

  if DM.cdsUsuarios.State in [dsInsert] then
  begin
    DM.cdsUsuariosID.AsString := TUtilitarios.GetId;
    DM.cdsUsuariosdata_cadastro.AsDateTime := now;
    DM.cdsUsuariosSenha.AsString := TBCrypt.GenerateHash(DM.TEMP_PASSWORD);
    DM.cdsUsuariosSenha_Temporaria.AsString := 'S';
  end;

  DM.cdsUsuariosNome.AsString := Trim(edtNome.Text);
  DM.cdsUsuariosLogin.AsString := Trim(edtLogin.Text);
  DM.cdsUsuariosStatus.AsString := LStatus;
  inherited;
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  DM := TdmUsuarios.Create( Self );
  SQL := DM.sqlUsuarios.SQL.Text;
  DataSource1.DataSet := DM.cdsUsuarios;
end;

procedure TfrmUsuarios.mnuLimparSenhaClick(Sender: TObject);
begin
  inherited;
  if not DataSource1.DataSet.IsEmpty then
  begin
    DM.LimparSenha(DataSource1.DataSet.FieldByName('ID').AsString);
    Application.MessageBox(PWideChar(format('Foi definida a senha padrão para o usuário "%s"',[DataSource1.DataSet.FieldByName('NOME').AsString ])), 'Atenção', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmUsuarios.Pesquisar;
begin
  inherited;
  //
end;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtNome.Text := DM.cdsUsuariosNome.AsString;
  edtLogin.Text := DM.cdsUsuariosLogin.AsString;
  ToggleStatus.State := tsson;

  if DM.cdsUsuariosStatus.AsString = 'B' then
    ToggleStatus.State := tssoff;

end;

end.
