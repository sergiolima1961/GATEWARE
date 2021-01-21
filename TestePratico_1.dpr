program Gateware;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  InscricaoFiscal in 'InscricaoFiscal.pas',
  uDM_testePratico in 'uDM_testePratico.pas' {DM_testepratico: TDataModule},
  CadCliente in 'CadCliente.pas' {fCadCliente},
  UCadProduto in 'UCadProduto.pas' {FCadProduto},
  uBusca in 'uBusca.pas' {FBusca},
  URelatorio in 'URelatorio.pas' {FRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_testepratico, DM_testepratico);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
