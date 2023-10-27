unit MonolitoFinanceiro.Model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TdmCaixa = class(TDataModule)
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    sqlCaixa: TFDQuery;
    cdsCaixaid: TStringField;
    cdsCaixanumero_doc: TStringField;
    cdsCaixadescricao: TStringField;
    cdsCaixavalor: TFMTBCDField;
    cdsCaixatipo: TStringField;
    cdsCaixadata_cadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCaixa: TdmCaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

end.
