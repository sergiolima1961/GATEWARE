unit URelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.TabNotBk,
  Vcl.Grids, Vcl.DBGrids;

type
  TFRelatorio = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    dsSaldoEstoque: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio: TFRelatorio;

implementation

{$R *.dfm}

uses uDM_testePratico;

procedure TFRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_testepratico.FRelatorio.Close;

end;

procedure TFRelatorio.FormCreate(Sender: TObject);
begin
  DM_testepratico.FRelatorio.Open;


end;

end.
