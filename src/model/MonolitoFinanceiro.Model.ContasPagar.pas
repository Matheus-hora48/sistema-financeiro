unit MonolitoFinanceiro.Model.ContasPagar;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmContasPagar = class(TDataModule)
    sqlContasPagar: TFDQuery;
    sqlContasPagarDetalhes: TFDQuery;
    sqlContasPagarParcela: TFDQuery;
    DataSource: TDataSource;
    dspContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    cdsContasPagarid: TStringField;
    cdsContasPagarnumero_documento: TStringField;
    cdsContasPagarvalor_compra: TFMTBCDField;
    cdsContasPagarvalor_abatido: TFMTBCDField;
    cdsContasPagardata_compra: TDateField;
    cdsContasPagardata_cadastro: TDateField;
    cdsContasPagarsqlContasPagarDetalhes: TDataSetField;
    cdsContasPagarDetalhes: TClientDataSet;
    cdsContasPagarDetalhesid: TStringField;
    cdsContasPagarDetalhesid_conta_pagar: TStringField;
    cdsContasPagarDetalhesdetalhes: TStringField;
    cdsContasPagarDetalhesusuario: TStringField;
    cdsContasPagarDetalhesmeio: TStringField;
    cdsContasPagarDetalhesstatus: TStringField;
    cdsContasPagarDetalhesqtd_parcelas: TIntegerField;
    cdsContasPagarParcela: TClientDataSet;
    cdsContasPagarsqlContasPagarParcela: TDataSetField;
    cdsContasPagarParcelaid: TStringField;
    cdsContasPagarParcelaid_conta_pagar: TStringField;
    cdsContasPagarParceladata_vencimento: TDateField;
    cdsContasPagarParcelavalor: TFMTBCDField;
    cdsContasPagarParceladata_recebimento: TDateField;
    cdsContasPagarParcelanumero_parcela: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmContasPagar: TdmContasPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

end.
