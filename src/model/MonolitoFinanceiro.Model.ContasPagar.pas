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
    cdsContasPagar: TClientDataSet;
    dspContasPagar: TDataSetProvider;
    sqlContasPagarDetalhe: TFDQuery;
    dspContasPagarDetalhe: TDataSetProvider;
    cdsContasPagarDetalhe: TClientDataSet;
    sqlContasPagarParcela: TFDQuery;
    dspContasPagarParcela: TDataSetProvider;
    cdsContasPagarParcela: TClientDataSet;
    cdsContasPagarid: TStringField;
    cdsContasPagarnumero_documento: TStringField;
    cdsContasPagarvalor_compra: TFMTBCDField;
    cdsContasPagarvalor_abatido: TFMTBCDField;
    cdsContasPagardata_compra: TDateField;
    cdsContasPagardata_cadastro: TDateField;
    cdsContasPagarDetalheid: TStringField;
    cdsContasPagarDetalheid_conta_pagar: TStringField;
    cdsContasPagarDetalhedetalhes: TStringField;
    cdsContasPagarDetalheusuario: TStringField;
    cdsContasPagarDetalhemeio: TStringField;
    cdsContasPagarDetalhestatus: TStringField;
    cdsContasPagarParcelaid: TStringField;
    cdsContasPagarParcelaid_conta_pagar: TStringField;
    cdsContasPagarParceladata_vencimento: TDateField;
    cdsContasPagarParcelavalor: TFMTBCDField;
    cdsContasPagarParceladata_recebimento: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmContasPagar: TdmContasPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
