unit MonolitoFinanceiro.Model.Usuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
  private
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado (Login: String; ID: String) : Boolean;

  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

{ TdmUsuarios }

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
