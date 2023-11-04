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
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    DataSource: TDataSource;
    sqlContasReceberDetalhes: TFDQuery;
    cdsContasReceberid: TStringField;
    cdsContasRecebernumero_documento: TStringField;
    cdsContasRecebervalor_venda: TFMTBCDField;
    cdsContasRecebervalor_abatido: TFMTBCDField;
    cdsContasReceberdata_compra: TDateField;
    cdsContasReceberdata_cadastro: TDateField;
    cdsContasReceberDetalhes: TClientDataSet;
    sqlContasReceberParcela: TFDQuery;
    cdsContasReceberParcela: TClientDataSet;
    cdsContasRecebersqlContasReceberDetalhes: TDataSetField;
    cdsContasRecebersqlContasReceberParcela: TDataSetField;
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
