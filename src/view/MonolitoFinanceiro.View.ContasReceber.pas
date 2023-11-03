unit MonolitoFinanceiro.View.ContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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

uses MonolitoFinanceiro.Utilitarios, MonolitoFinanceiro.Model.Usuario;

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
     FDAO := TdmContasReceber.Create(self);

  Result := FDAO;
end;

procedure TfrmContasReceber.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Dao.cdsContasReceberid.AsString := TUtilitarios.GetID;
  Dao.cdsContasReceberdata_compra.AsDateTime := now;
  Dao.cdsContasReceberdata_cadastro.AsDateTime := now;
  Dao.cdsContasReceberDetalhesusuario.AsString := dmUsuarios.GetUsuarioLogado.Login;
end;

procedure TfrmContasReceber.FormShow(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdmContasReceber, dmContasReceber);
  dtpDataCompra.Date := now;
  dtpDataVencimento.Date := now + 30;
  btnSalvar.Enabled := False;
end;



end.
