unit MonolitoFinanceiro.View.ContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  MonolitoFinanceiro.Model.ContasReceber;

type
  TfrmContasReceber = class(TfrmCadastroPadrao)
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    btnGerarParcelas: TButton;
    DBGrid4: TDBGrid;
    dtpDataCompra: TDateTimePicker;
    dtpDataVencimento: TDateTimePicker;
    edtDesconto: TDBEdit;
    edtDetalhes: TDBEdit;
    edtNDocumento: TDBEdit;
    edtParcelas: TDBEdit;
    edtValorVenda: TDBEdit;
    lblDataCompra: TLabel;
    lblDataVencimento: TLabel;
    lblDesconto: TLabel;
    lblDetalhes: TLabel;
    lblNDocumento: TLabel;
    lblQTDParcelas: TLabel;
    lblValorVenda: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    lblValorParcela: TLabel;
    lblParcela: TLabel;
    Panel9: TPanel;
    Label2: TLabel;
    lblQtdPrarcelasValor: TLabel;
    Panel10: TPanel;
    Label3: TLabel;
    lblValorTotal: TLabel;
    RadioGroup: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure RadioGroupClick(Sender: TObject);
  private
    { Private declarations }
    FDAO: TdmContasReceber;
    function GetDAO: TdmContasReceber;
  public
    { Public declarations }
    property DAO: TdmContasReceber read GetDAO;
  end;

var
  frmContasReceber: TfrmContasReceber;

implementation

{$R *.dfm}

uses  StrUtils, MonolitoFinanceiro.Utilitarios, MonolitoFinanceiro.Model.Usuario,
  System.SysUtils;

procedure TfrmContasReceber.FormCreate(Sender: TObject);
begin
  inherited;
  DataSource1.DataSet := DAO.cdsContasReceber;
  DataSource2.DataSet := DAO.cdsContasReceberDetalhes;
  DataSource3.DataSet := DAO.cdsContasReceberParcela;
end;

function TfrmContasReceber.GetDAO: TdmContasReceber;
begin
  if not Assigned( FDAO ) then
     FDAO := TdmContasReceber.Create(Self);

  Result := FDAO;
end;

procedure TfrmContasReceber.btnIncluirClick(Sender: TObject);
begin
  inherited;
  DataSource2.DataSet.Open;
  DAO.cdsContasReceber.FindField('id').AsString:= TUtilitarios.GetID;
  DAO.cdsContasReceber.FindField('data_cadastro').AsDateTime := now;
  DAO.cdsContasReceber.FindField('data_compra').AsDateTime := now;
end;

procedure TfrmContasReceber.btnSalvarClick(Sender: TObject);
var
  LMeio : String;
  LStatus : String;

  LError: String;
  LControlFocus: TWinControl;

  procedure SetarFocuPrimeiroCntrole(const AWinControl: TWinControl);
  begin
    if not Assigned( LControlFocus ) then
       LControlFocus := AWinControl;
  end;
begin
  LControlFocus := nil;

  if Trim(edtNDocumento.Text) = '' then
  begin
    SetarFocuPrimeiroCntrole(edtNDocumento);
    LError := LError + 'O Campo Numero do documento não pode ser vazio' + sLineBreak;
  end;

  if Trim(edtValorVenda.Text) = '' then
  begin
    SetarFocuPrimeiroCntrole(edtValorVenda);
    LError := LError + 'O Campo Valo da venda não pode ser vazio' + sLinebreak;
  end;

  if Trim(edtDesconto.Text) = '' then
  begin
    SetarFocuPrimeiroCntrole(edtDesconto);
    LError := LError + 'O Campo Desconto não pode ser vazio' + sLinebreak;
  end;
  if not (StrToFloat(edtParcelas.text) > 0) then
  begin
    SetarFocuPrimeiroCntrole(edtParcelas);
    LError := LError + 'A Qtd de parcelas deve ser preenchida.' + sLinebreak;
  end;

  case RadioGroup.ItemIndex of
  0: LMeio := 'A';
  1: LMeio := 'C';
  2: LMeio := 'D';
  else
    begin
      LError := LError + 'Por favor, selecione uma opção no RadioGroup.' + sLinebreak;
    end;
  end;

  if not LError.IsEmpty then
  begin
    Application.MessageBox(PChar( LError ),'Atenção',MB_OK + MB_ICONEXCLAMATION);

    if Assigned( LControlFocus ) then
       LControlFocus.SetFocus;
  end;

  LStatus := 'A';

  DAO.cdsContasReceber.FindField('data_compra').AsDateTime := dtpDataCompra.Date;

  DAO.cdsContasReceberDetalhes.FindField('id').AsString := TUtilitarios.GetID;
  DAO.cdsContasReceberDetalhes.FindField('id_conta_receber').AsString := DAO.cdsContasReceber.FindField('id').AsString;
  DAO.cdsContasReceberDetalhes.FindField('meio').AsString := LMeio;
  DAO.cdsContasReceberDetalhes.FindField('status').AsString := LStatus;

  inherited;
end;


procedure TfrmContasReceber.btnGerarParcelasClick(Sender: TObject);
var
  valor_total, valor_desconto, valor_parcela: Double;
  numero_parcelas, i: Integer;
  data_vencimento: TDate;
begin
  valor_total := StrToFloatDef(edtValorVenda.Text, 0);
  valor_desconto := StrToFloatDef(edtDesconto.Text, 0);
  DAO.cdsContasReceberDetalhesusuario.AsString := dmUsuarios.GetUsuarioLogado.Login;

  if RadioGroup.ItemIndex = 0 then
  begin
    numero_parcelas := 1;
  end
  else
  begin
    numero_parcelas := StrToIntDef(edtParcelas.Text, 0);
  end;

  valor_total := StrToFloat(edtValorVenda.Text);
  valor_desconto := StrToFloat(edtDesconto.Text);
  numero_parcelas := StrToInt(edtParcelas.text);

  valor_total := valor_total - valor_desconto;
  valor_parcela := valor_total / numero_parcelas;
  data_vencimento := dtpDataVencimento.Date;

  lblValorParcela.Caption := TUtilitarios.FormatoMoeda(valor_parcela);
  lblValorTotal.Caption := TUtilitarios.FormatoMoeda(valor_total);
  lblQtdPrarcelasValor.Caption := IntToStr(numero_parcelas) + 'x';

  for i := 1 to numero_parcelas do
  begin
    DAO.cdsContasReceberParcela.Append;
    DAO.cdsContasReceberParcela.FindField('id').AsString := TUtilitarios.GetID;
    DAO.cdsContasReceberParcela.FindField('id_conta_receber').AsString := DAO.cdsContasReceber.FindField('id').AsString;
    DAO.cdsContasReceberParcela.FindField('data_vencimento').AsDateTime := data_vencimento;
    DAO.cdsContasReceberParcela.FindField('valor').AsBCD := valor_parcela;
    DAO.cdsContasReceberParcela.FindField('numero_parcela').AsInteger := i;
    DAO.cdsContasReceberParcela.Post;

    data_vencimento := IncMonth(data_vencimento, 1);
  end;

  btnSalvar.Enabled := True;
end;

procedure TfrmContasReceber.FormShow(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TdmContasReceber, dmContasReceber);
   dtpDataCompra.Date := now;
   dtpDataVencimento.Date := now + 30;
   btnSalvar.Enabled := False;
end;

procedure TfrmContasReceber.RadioGroupClick(Sender: TObject);
begin
  inherited;
  case RadioGroup.ItemIndex of
    0, 2: begin
      edtParcelas.Text := '1';
      edtParcelas.Enabled := False;
    end;
    1: begin
      edtParcelas.Enabled := True;
    end;
  end;
end;
end.
