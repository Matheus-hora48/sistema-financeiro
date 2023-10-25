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
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardPesquisa;
end;

procedure TfrmCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := CardPesquisa;
end;

end.
