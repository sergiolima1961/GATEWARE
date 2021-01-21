object FRelatorio: TFRelatorio
  Left = 0
  Top = 0
  Caption = 'Relatorios'
  ClientHeight = 380
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TabbedNotebook1: TTabbedNotebook
    Left = 0
    Top = 0
    Width = 653
    Height = 380
    Align = alClient
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    TabOrder = 0
    ExplicitLeft = 280
    ExplicitTop = 32
    ExplicitWidth = 300
    ExplicitHeight = 250
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Saldo de estoque'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 645
        Height = 352
        Align = alClient
        DataSource = dsSaldoEstoque
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Livre'
      ExplicitWidth = 292
      ExplicitHeight = 222
    end
  end
  object dsSaldoEstoque: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FRelatorio
    Left = 108
    Top = 200
  end
end
