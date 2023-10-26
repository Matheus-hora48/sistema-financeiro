unit MonolitoFinanceiro.Model.Entidade.Usuario;

interface
type
  TModeEntidadeUsuario = class
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

procedure TModeEntidadeUsuario.SetID(const Value: String);
begin
  FID := Value;
end;

procedure TModeEntidadeUsuario.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TModeEntidadeUsuario.SetNome(const Value: String);
begin
  FNome:= Value;
end;

end.
