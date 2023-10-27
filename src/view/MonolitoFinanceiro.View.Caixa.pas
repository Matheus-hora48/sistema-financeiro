unit MonolitoFinanceiro.View.Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels;

type
  TfrmCaixa = class(TfrmCadastroPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Caixa, MonolitoFinanceiro.Utilitarios;

{ TfrmCadastroPadrao1 }

procedure TfrmCaixa.Pesquisar;
var
  FiltroPesquisa : String;

begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisar.Text,DBGrid1);
  dmCaixa.cdsCaixa.Close;
  dmCaixa.cdsCaixa.CommandText := 'select * from caixa' + FiltroPesquisa;
  dmCaixa.cdsCaixa.Open;
  inherited;

end;

end.
