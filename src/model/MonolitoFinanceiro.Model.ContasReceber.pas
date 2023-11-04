unit MonolitoFinanceiro.Model.ContasReceber;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient;

type
  TdmContasReceber = class(TDataModule)
    sqlContasReceber: TFDQuery;
    sqlContasReceberDetalhes: TFDQuery;
    sqlContasReceberParcela: TFDQuery;
    DataSource: TDataSource;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    cdsContasReceberDetalhes: TClientDataSet;
    cdsContasReceberParcela: TClientDataSet;
    cdsContasReceberid: TStringField;
    cdsContasRecebernumero_documento: TStringField;
    cdsContasRecebervalor_venda: TFMTBCDField;
    cdsContasRecebervalor_abatido: TFMTBCDField;
    cdsContasReceberdata_compra: TDateField;
    cdsContasReceberdata_cadastro: TDateField;
    cdsContasRecebersqlContasReceberParcela: TDataSetField;
    cdsContasRecebersqlContasReceberDetalhes: TDataSetField;
    cdsContasReceberDetalhesid: TStringField;
    cdsContasReceberDetalhesid_conta_receber: TStringField;
    cdsContasReceberDetalhesdetalhes: TStringField;
    cdsContasReceberDetalhesusuario: TStringField;
    cdsContasReceberDetalhesmeio: TStringField;
    cdsContasReceberDetalhesstatus: TStringField;
    cdsContasReceberDetalhesqtd_parcelas: TIntegerField;
    cdsContasReceberParcelaid: TStringField;
    cdsContasReceberParcelaid_conta_receber: TStringField;
    cdsContasReceberParceladata_vencimento: TDateField;
    cdsContasReceberParcelavalor: TFMTBCDField;
    cdsContasReceberParceladata_recebimento: TDateField;
    cdsContasReceberParcelanumero_parcela: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmContasReceber: TdmContasReceber;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

end.
