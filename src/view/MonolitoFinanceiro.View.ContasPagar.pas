unit MonolitoFinanceiro.View.ContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.ComCtrls;

type
  TfrmContasPagar = class(TfrmCadastroPadrao)
    DBGrid2: TDBGrid;
    pnlDetalhes: TPanel;
    DataSource2: TDataSource;
    pnlParcelas: TPanel;
    DBGrid3: TDBGrid;
    Panel2: TPanel;
    lblValorCompra: TLabel;
    edtValorCompra: TEdit;
    lblDesconto: TLabel;
    edtDesconto: TEdit;
    lblDetalhes: TLabel;
    edtDetalhes: TEdit;
    dtpDataCompra: TDateTimePicker;
    lblDataCompra: TLabel;
    RadioGroup: TRadioGroup;
    lblNDocumento: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    edtNDocumento: TEdit;
    lblQTDParcelas: TLabel;
    dtpDataVencimento: TDateTimePicker;
    lblDataVencimento: TLabel;
    cbParcelas: TComboBox;
    Panel6: TPanel;
    lblValorParcela: TLabel;
    Panel7: TPanel;
    lblParcela: TLabel;
    Label2: TLabel;
    lblQtdPrarcelasValor: TLabel;
    btnGerarParcelas: TButton;
    Panel8: TPanel;
    Label3: TLabel;
    lblValorTotal: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.ContasPagar, MonolitoFinanceiro.Utilitarios,
  MonolitoFinanceiro.Model.Usuario;

procedure TfrmContasPagar.btnSalvarClick(Sender: TObject);
var
  LMeio : String;
  LStatus : String;
  valor_total, valor_desconto, valor_parcela: Double;
  numero_parcelas, i: Integer;
  data_vencimento: TDate;
begin
  dataSource2.DataSet.Insert;
  if Trim(edtNDocumento.Text) = '' then
  begin
    edtNDocumento.SetFocus;
    Application.MessageBox('O Campo Numero do documento n�o pode ser vazio', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edtValorCompra.Text) = '' then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('O Campo Valo da compra n�o pode ser vazio', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edtDesconto.Text) = '' then
  begin
    edtDesconto.SetFocus;
    Application.MessageBox('O Campo Desconto n�o pode ser vazio', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  valor_total := StrToFloat(edtValorCompra.Text);
  valor_desconto := StrToFloat(edtDesconto.Text);

  if RadioGroup.ItemIndex = 0 then
  begin
    numero_parcelas := 1;
  end
  else
  begin
    numero_parcelas := StrToInt(cbParcelas.Text);
  end;

  valor_total := valor_total - valor_desconto;
  valor_parcela := valor_total / numero_parcelas;
  data_vencimento := dtpDataVencimento.Date;
  lblValorParcela.Caption := TUtilitarios.FormatoMoeda(valor_parcela);
  lblQtdPrarcelasValor.Caption := IntToStr(numero_parcelas) + 'x';

  LStatus := 'A';

  case RadioGroup.ItemIndex of
    0: LMeio := 'A';
    1: LMeio := 'C';
    2: LMeio := 'D';
  end;

  dmContasPagar.cdsContasPagar.Append;
  dmContasPagar.cdsContasPagar.FieldByName('id').AsString := TUtilitarios.GetID;
  dmContasPagar.cdsContasPagar.FieldByName('numero_documento').AsString := Trim(edtNDocumento.Text);
  dmContasPagar.cdsContasPagar.FieldByName('valor_compra').AsFloat := valor_total;
  dmContasPagar.cdsContasPagar.FieldByName('valor_abatido').AsFloat := valor_desconto;
  dmContasPagar.cdsContasPagarDetalhe.FieldByName('detalhes').AsString := Trim(edtDetalhes.Text);
  dmContasPagar.cdsContasPagar.FieldByName('data_compra').AsDateTime := dtpDataCompra.Date;

  dmContasPagar.cdsContasPagarDetalhe.Append;
  dmContasPagar.cdsContasPagarDetalhe.FieldByName('id').AsString := TUtilitarios.GetID;
  dmContasPagar.cdsContasPagarDetalhe.FieldByName('id_conta_pagar').AsString := dmContasPagar.cdsContasPagar.FieldByName('id_conta_pagar').AsString;
  dmContasPagar.cdsContasPagarDetalhe.FieldByName('usuario').AsString := TUtilitarios.GetID;
  dmContasPagar.cdsContasPagarDetalhe.FieldByName('status').AsString := LStatus;
  dmContasPagar.cdsContasPagarDetalhe.FieldByName('meio_pagamento').AsString := LMeio;

  dmContasPagar.cdsContasPagarDetalhe.ApplyUpdates(0);
  dmContasPagar.cdsContasPagar.ApplyUpdates(0);

  for i := 1 to numero_parcelas do
  begin
    dmContasPagar.cdsContasPagarParcela.Append;
    dmContasPagar.cdsContasPagarParcela.FieldByName('id').AsString := TUtilitarios.GetID;
    dmContasPagar.cdsContasPagarParcela.FieldByName('id_conta_pagar').AsString := dmContasPagar.cdsContasPagar.FieldByName('id').AsString;
    dmContasPagar.cdsContasPagarParcela.FieldByName('data_vencimento').AsDateTime := data_vencimento;
    dmContasPagar.cdsContasPagarParcela.FieldByName('valor').AsFloat := valor_parcela;
    data_vencimento := IncMonth(data_vencimento, 1);
  end;

  dmContasPagar.cdsContasPagarParcela.ApplyUpdates(0);

  inherited;
end;


procedure TfrmContasPagar.btnGerarParcelasClick(Sender: TObject);
var
  valor_total, valor_desconto, valor_parcela: Double;
  numero_parcelas, i: Integer;
  data_vencimento: TDate;
begin
  valor_total := StrToFloat(edtValorCompra.Text);
  valor_desconto := StrToFloat(edtDesconto.Text);

  if RadioGroup.ItemIndex = 0 then
  begin
    numero_parcelas := 1;
  end
  else
  begin
    numero_parcelas := StrToInt(cbParcelas.Text);
  end;

  valor_total := valor_total - valor_desconto;
  valor_parcela := valor_total / numero_parcelas;
  data_vencimento := dtpDataVencimento.Date;
  lblValorParcela.Caption := TUtilitarios.FormatoMoeda(valor_parcela);
  lblValorTotal.Caption := TUtilitarios.FormatoMoeda(valor_total);
  lblQtdPrarcelasValor.Caption := IntToStr(numero_parcelas) + 'x';

  dmContasPagar.cdsContasPagarParcela.EmptyDataSet;

  for i := 1 to numero_parcelas do
  begin
    dmContasPagar.cdsContasPagarParcela.Append;
    dmContasPagar.cdsContasPagarParcela.FieldByName('id').AsString := TUtilitarios.GetID;
    dmContasPagar.cdsContasPagarParcela.FieldByName('id_conta_pagar').AsString := dmContasPagar.cdsContasPagar.FieldByName('id').AsString;
    dmContasPagar.cdsContasPagarParcela.FieldByName('data_vencimento').AsDateTime := data_vencimento;
    dmContasPagar.cdsContasPagarParcela.FieldByName('valor').AsFloat := valor_parcela;
    data_vencimento := IncMonth(data_vencimento, 1);
  end;
end;



procedure TfrmContasPagar.FormShow(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TdmContasPagar, dmContasPagar);
   dtpDataCompra.Date := now;
   dtpDataVencimento.Date := now + 30;
end;

end.
