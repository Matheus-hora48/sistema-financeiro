unit MonolitoFinanceiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.WinXPanels, System.ImageList, Vcl.ImgList;

type
  TfrmCadastroPadrao = class(TForm)
    PnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    pnlPesquisa: TPanel;
    pnlPesquisaButoes: TPanel;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    edtPesquisar: TEdit;
    Label1: TLabel;
    btnPesquisar: TButton;
    ImageList1: TImageList;
    btnFechar: TButton;
    btnImprimir: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    Panel1: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    DataSource1: TDataSource;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitarBotoes;
    procedure LimparCampos;
  public
    { Public declarations }
  protected
    procedure Pesquisar; virtual;
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

uses
  Datasnap.DBClient, Vcl.WinXCtrls;

{$R *.dfm}

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  TClientDataSet(dataSource1.DataSet).Cancel;
  pnlPrincipal.ActiveCard := cardPesquisa;
end;

procedure TfrmCadastroPadrao.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    TClientDataSet(dataSource1.DataSet).Delete;
    TClientDataSet(dataSource1.DataSet).ApplyUpdates(0);
    Application.MessageBox('Registro excluído com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Pesquisar;
    except on E: Exception do
      Application.MessageBox(PWideChar(E.Message),'Erro ao excluir registro',MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  LimparCampos;
  pnlPrincipal.ActiveCard := cardCadastro;
  TClientDataSet(dataSource1.DataSet).Insert;
end;

procedure TfrmCadastroPadrao.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCadastroPadrao.btnSalvarClick(Sender: TObject);
var
   Mensagem : String;
begin
Mensagem := 'Registro alterado com sucesso!';

  if dataSource1.State in [dsInsert] then
    Mensagem := 'Registro incluido com sucesso!';

  TClientDataSet(dataSource1.DataSet).Post;
  TClientDataSet(dataSource1.DataSet).ApplyUpdates(0);
  Application.MessageBox(PWideChar(Mensagem), 'Atenção', MB_OK + MB_ICONINFORMATION);

  Pesquisar;
  pnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  TClientDataSet(dataSource1.DataSet).Edit;
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := CardPesquisa;
  Pesquisar;
end;

procedure TfrmCadastroPadrao.HabilitarBotoes;
begin
  btnExcluir.Enabled := not DataSource1.DataSet.IsEmpty;
  btnAlterar.Enabled := not DataSource1.DataSet.IsEmpty;
end;

procedure TfrmCadastroPadrao.LimparCampos;
var
  Contador : Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
  begin
    if Components[Contador] is TCustomEdit then
      TCustomEdit(Components[Contador]).Clear
    else if Components[Contador]is TToggleSwitch then
      TToggleSwitch(Components[Contador]).State := tsson
    else if Components[Contador] is TRadioGroup then
      TRadioGroup(Components[Contador]).ItemIndex := -1;

  end;
end;

procedure TfrmCadastroPadrao.Pesquisar;
begin
  HabilitarBotoes;
end;

end.
