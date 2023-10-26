unit MonolitoFinanceiro.Model.Entidade.Usuario;

interface
type
  TModelEntidadeUsuario = class
  private
    FLogin: String;
    FNome: String;
    FID: String;
    procedure SetID(const Value: String);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value: String);
  public
    property Nome : String read FLogin write SetNome;
    property Login : String read FID write SetLogin;
    property ID : String read FID write SetID;
  end;


implementation

{ TModeEntidadeUsuario }

procedure TModelEntidadeUsuario.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TModelEntidadeUsuario.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TModelEntidadeUsuario.SetNome(const Value: String);
begin
  FNome:= Value;
end;

end.
