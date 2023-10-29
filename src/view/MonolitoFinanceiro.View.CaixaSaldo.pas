unit MonolitoFinanceiro.View.CaixaSaldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.WinXPanels, Vcl.ComCtrls,
  MonolitoFinanceiro.Model.Entidade.Caixa.Resumo;

type
  TfrmCaixaSaldo = class(TForm)
    pnlPrincipal: TPanel;
    pnlPesquisar: TPanel;
    pnlContent: TPanel;
    ImageList1: TImageList;
    btnPesquisar: TButton;
    dateInicial: TDateTimePicker;
    dateFinal: TDateTimePicker;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    StackPanel1: TStackPanel;
    pnlSaldoFinal: TPanel;
    lblSaldoFinal: TLabel;
    lblValorFinal: TLabel;
    pnlSaldoParcial: TPanel;
    lblSaldoParcial: TLabel;
    lblValorParcial: TLabel;
    pnlTotalSaida: TPanel;
    lblTotalSaidas: TLabel;
    lblValorSaida: TLabel;
    pnlTotalEntrada: TPanel;
    lblTotalEntradas: TLabel;
    lblValorEntrada: TLabel;
    pnlSaldoInicial: TPanel;
    Label8: TLabel;
    lblValorInicial: TLabel;
    pnlLineHeader: TPanel;
    pnlLineFooter: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;

  public
    { Public declarations }

  end;

var
  frmCaixaSaldo: TfrmCaixaSaldo;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Caixa, MonolitoFinanceiro.Model.Conexao,
  FireDAC.Comp.Client, MonolitoFinanceiro.View.CadastroPadrao, System.DateUtils,
  MonolitoFinanceiro.Utilitarios;

{ TfrmCaixaSaldo }
{ TfrmCaixaSaldo }

procedure TfrmCaixaSaldo.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCaixaSaldo.FormShow(Sender: TObject);
begin
  dateInicial.Date := IncDay(Now, -7);
  Pesquisar;
end;

procedure TfrmCaixaSaldo.Pesquisar;
var
   ResumoCaixa : TModelResumoCaixa;
begin
  lblValorInicial.Caption := '';
  lblValorEntrada.Caption := '';
  lblValorSaida.Caption := '';
  lblValorParcial.Caption := '';
  lblValorFinal.Caption := '';

  ResumoCaixa := dmCaixa.ResumoCaixa(dateInicial.Date, dateFinal.Date);

  try
    lblValorInicial.Caption := TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoInicial);
    lblValorEntrada.Caption := TUtilitarios.FormatoMoeda(ResumoCaixa.TotalEntradas);
    lblValorSaida.Caption := TUtilitarios.FormatoMoeda(ResumoCaixa.TotalSaidas);
    lblValorParcial.Caption := TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoParcial);
    lblValorFinal.Caption := TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoFinal);
  finally
    ResumoCaixa.Free;
  end;
end;

end.
