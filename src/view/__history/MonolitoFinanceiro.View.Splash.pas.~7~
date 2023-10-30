unit MonolitoFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmSplash = class(TForm)
    pnlPrincipal: TPanel;
    Image1: TImage;
    lblNameAplicacao: TLabel;
    ProgressBar: TProgressBar;
    Timer1: TTimer;
    Panel1: TPanel;
    lblStatus: TLabel;
    imgDll: TImage;
    imgBancoDeDados: TImage;
    imgConfiguracoes: TImage;
    imgIniciando: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarStatus(Mensagem: String; Imagem: TImage);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.AtualizarStatus(Mensagem: String; Imagem: TImage);
begin
  lblStatus.Caption := Mensagem;
  Imagem.Visible := true;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  if ProgressBar.Position <= 100 then
  begin
    ProgressBar.StepIt;
    case ProgressBar.Position of
      10: AtualizarStatus('Carregando dependências...', imgDll);
      25: AtualizarStatus('Conectando ao banco de dados...', imgBancoDeDados);
      45: AtualizarStatus('Carregando as configurações...', imgConfiguracoes);
      75: AtualizarStatus('Iniciando o Sistema...', imgIniciando);
    end;
  end;
  if ProgressBar.Position = 100 then
    Close;


end;

end.
