unit MonolitoFinanceiro.Model.Usuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Entidade.Usuario;

type
  TdmUsuarios = class(TDataModule)
    sqlUsuarios: TFDQuery;
    cdsUsuarios: TClientDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuariosid: TStringField;
    cdsUsuariosnome: TStringField;
    cdsUsuarioslogin: TStringField;
    cdsUsuariossenha: TStringField;
    cdsUsuariosstatus: TStringField;
    cdsUsuariosdata_cadastro: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FEntidadeUsuario : TModelEntidadeUsuario;
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado (Login: String; ID: String) : Boolean;
    procedure EfetuarLogin(Login : String; Senha: String);
    function GetUsuarioLogado : TModelEntidadeUsuario;
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

{ TdmUsuarios }

procedure TdmUsuarios.DataModuleCreate(Sender: TObject);
begin
  FEntidadeUsuario := TModelEntidadeUsuario.Create;
end;

procedure TdmUsuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TdmUsuarios.EfetuarLogin(Login, Senha: String);
var
  SQLConsulta : TFDQuery;
begin
   SQLConsulta := TFDQuery.Create(Self);
  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT * FROM USUARIOS WHERE LOGIN = :LOGIN AND SENHA = :SENHA');
    SQLConsulta.ParamByName('LOGIN').AsString := LOGIN;
    SQLConsulta.ParamByName('SENHA').AsString := SENHA;
    SQLConsulta.Open;

    if SQLConsulta.IsEmpty then
      raise Exception.Create('Usuário e/ou senha inválidos');
    if SQLConsulta.FieldByName('STATUS').AsString <> 'A' then
      raise Exception.Create('Usuário bloqueado, favor entrar em contato com o administrador');

    FEntidadeUsuario.ID := SQLConsulta.FieldByName('ID').AsString;
    FEntidadeUsuario.NOME := SQLConsulta.FieldByName('NOME').AsString;
    FEntidadeUsuario.LOGIN := SQLConsulta.FieldByName('LOGIN').AsString;
  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;

end;

function TdmUsuarios.GetUsuarioLogado: TModelEntidadeUsuario;
begin
  Result := FEntidadeUsuario;
end;

function TdmUsuarios.TemLoginCadastrado(Login, ID: String): Boolean;
var
  SQLConsulta : TFDQuery;
begin
  Result := false;
  SQLConsulta := TFDQuery.Create(nil);
  try
     SQLConsulta.Connection := dmConexao.SQLConexao;
     SQLConsulta.SQL.Clear;
     SQLConsulta.SQL.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
     SQLConsulta.ParamByName('LOGIN').AsString := LOGIN;
     SQLConsulta.Open;

     if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('ID').AsString <> ID;

  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;

end.
