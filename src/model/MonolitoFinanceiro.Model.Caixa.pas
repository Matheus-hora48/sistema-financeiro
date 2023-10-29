unit MonolitoFinanceiro.Model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  MonolitoFinanceiro.Model.Entidade.Caixa.Resumo;

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
    function GetSaldoAnterio(Date : TDate) : Currency;
    function GetTotalEntradasCaixa (DataInicial, DataDinal: TDate) : Currency;
    function GetTotalSaidasCaixa (DataInicial, DataDinal: TDate) : Currency;
  public
    { Public declarations }
    function ResumoCaixa(DataInicial, DataDinal: TDate) : TModelResumoCaixa;
  end;

var
  dmCaixa: TdmCaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

{ TdmCaixa }

function TdmCaixa.GetSaldoAnterio(Date: TDate): Currency;
var
  SQLConsulta : TFDQuery;
  TotalEntradas : Currency;
  TotalSaidas : Currency;
begin
  SQLConsulta := TFDQuery.Create(nil);
  try
    Result := 0;
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE TIPO = ''R''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO < :DATA');
    SQLCOnsulta.ParamByName('DATA').AsDate := Date;
    SQLConsulta.Open;
    TotalEntradas := SQLConsulta.FieldByName('VALOR').AsCurrency;

    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE TIPO = ''D''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO < :DATA');
    SQLCOnsulta.ParamByName('DATA').AsDate := Date;
    SQLConsulta.Open;
    TotalSaidas := SQLConsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLConsulta.Free;
  end;
  Result := TotalEntradas - TotalSaidas;
end;

function TdmCaixa.GetTotalEntradasCaixa(DataInicial,
  DataDinal: TDate): Currency;
var
  SQLConsulta : TFDQuery;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE TIPO = ''R''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL');
    SQLCOnsulta.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLCOnsulta.ParamByName('DATAFINAL').AsDate := DataDinal;
    SQLConsulta.Open;
    Result := sqlConsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLConsulta.Free;
  end;
end;

function TdmCaixa.GetTotalSaidasCaixa(DataInicial, DataDinal: TDate): Currency;
var
  SQLConsulta : TFDQuery;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);
  try
     SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT IFNULL(SUM(VALOR), 0) AS VALOR FROM CAIXA WHERE TIPO = ''D''');
    SQLConsulta.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL');
    SQLCOnsulta.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLCOnsulta.ParamByName('DATAFINAL').AsDate := DataDinal;
    SQLConsulta.Open;
    Result := sqlConsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLConsulta.Free;
  end;
end;

function TdmCaixa.ResumoCaixa(DataInicial, DataDinal: TDate): TModelResumoCaixa;
begin

  if DataInicial > DataDinal then
    raise Exception.Create('Período inváliso');
  Result := TModelResumoCaixa.Create;
  try
    Result.SaldoInicial := GetSaldoAnterio(DataInicial);
    Result.TotalSaidas := GetTotalEntradasCaixa(DataInicial, DataDinal);
    Result.TotalEntradas  := GetTotalSaidasCaixa(DataInicial, DataDinal);
  except
    Result.Free;
    raise;
  end;

end;

end.
