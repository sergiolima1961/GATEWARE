object fCadCliente: TfCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 380
  ClientWidth = 643
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 641
    Height = 380
    Align = alLeft
    Caption = 'Cadastro Cliente'
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 44
      Width = 637
      Height = 121
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 47
        Top = 35
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit1
      end
      object Label15: TLabel
        Left = 41
        Top = 6
        Width = 31
        Height = 13
        Caption = 'codigo'
        FocusControl = DBEdit12
      end
      object Label2: TLabel
        Left = 7
        Top = 59
        Width = 71
        Height = 13
        Caption = 'Dt Nascimemto'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 41
        Top = 89
        Width = 33
        Height = 13
        Caption = 'E MAIL'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 87
        Top = 32
        Width = 544
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Nome'
        DataSource = DS_CLIENTE
        TabOrder = 0
      end
      object DBEdit12: TDBEdit
        Left = 87
        Top = 6
        Width = 58
        Height = 21
        DataField = 'Codigo'
        DataSource = DS_CLIENTE
        Enabled = False
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 87
        Top = 59
        Width = 83
        Height = 21
        DataField = 'Data Nascimemto'
        DataSource = DS_CLIENTE
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 87
        Top = 86
        Width = 544
        Height = 21
        CharCase = ecLowerCase
        DataField = 'E MAIL'
        DataSource = DS_CLIENTE
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 637
      Height = 29
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 1
      object Label16: TLabel
        Left = 398
        Top = 8
        Width = 52
        Height = 13
        Caption = '0000/0000'
      end
      object Button1: TButton
        Left = 2
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Novo'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 226
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 1
        OnClick = Button2Click
        ExplicitLeft = 170
      end
      object Button3: TButton
        Left = 170
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 2
        OnClick = Button3Click
        ExplicitTop = -2
      end
      object Button4: TButton
        Left = 58
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Editar'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 114
        Top = 2
        Width = 56
        Height = 25
        Align = alLeft
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = Button5Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 165
      Width = 637
      Height = 213
      Align = alClient
      DataSource = DS_CLIENTE
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DS_CLIENTE: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FvCliente
    OnDataChange = DS_CLIENTEDataChange
    Left = 496
    Top = 48
  end
end
