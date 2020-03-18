object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Caption = 'CRUD com Editor Html'
  ClientHeight = 352
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pcPrinc: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 753
    Height = 336
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = tsManut
    Align = alClient
    TabHeight = 25
    TabOrder = 0
    OnChange = pcPrincChange
    object tsLista: TTabSheet
      Caption = ':: Listagem  '
      ExplicitWidth = 759
      ExplicitHeight = 310
      object pBotoesLista: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pBotoesLista'
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object btnAbrir: TButton
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Hint = 'Executar pesquisa'
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Abrir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnAbrirClick
          ExplicitLeft = 341
          ExplicitTop = 43
        end
        object btnApagar1: TButton
          AlignWithMargins = True
          Left = 214
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acApagar
          Align = alLeft
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          ExplicitLeft = 456
          ExplicitTop = 46
        end
        object btnIncluir1: TButton
          AlignWithMargins = True
          Left = 111
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acIncluir
          Align = alLeft
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ExplicitLeft = 70
        end
      end
      object pGrid: TPanel
        Left = 0
        Top = 35
        Width = 745
        Height = 266
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 73
        ExplicitWidth = 759
        ExplicitHeight = 237
        object dbgCRUD: TMDBGrid
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 729
          Height = 250
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Align = alClient
          DataSource = dsCRUD
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgFlat]
          ParentFont = False
          RowsHeight = 0
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Calibri'
          TitleFont.Style = [fsBold]
          OnDblClick = dbgCRUDDblClick
          FrozenCols = 0
        end
      end
    end
    object tsManut: TTabSheet
      Caption = ':: Manuten'#231#227'o  '
      ImageIndex = 1
      ExplicitWidth = 653
      object pBotoesManut: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        ExplicitWidth = 653
        object btnCancelar2: TButton
          AlignWithMargins = True
          Left = 523
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acCancelar
          Align = alLeft
          TabOrder = 5
        end
        object btnGravar2: TButton
          AlignWithMargins = True
          Left = 420
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acGravar
          Align = alLeft
          TabOrder = 4
        end
        object btnApagar2: TButton
          AlignWithMargins = True
          Left = 317
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acApagar
          Align = alLeft
          TabOrder = 3
        end
        object btnEditar2: TButton
          AlignWithMargins = True
          Left = 214
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acEditar
          Align = alLeft
          TabOrder = 2
        end
        object btnIncluir2: TButton
          AlignWithMargins = True
          Left = 111
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acIncluir
          Align = alLeft
          TabOrder = 1
        end
        object btnListagem2: TButton
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 95
          Height = 27
          Cursor = crHandPoint
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 0
          Margins.Bottom = 0
          Action = acListagem
          Align = alLeft
          TabOrder = 0
        end
      end
      object scbManut: TScrollBox
        Left = 0
        Top = 35
        Width = 745
        Height = 266
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWhite
        Padding.Bottom = 8
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          745
          266)
        object Label1: TLabel
          Left = 8
          Top = 3
          Width = 12
          Height = 15
          Caption = 'ID'
          FocusControl = dbID
        end
        object Label2: TLabel
          Left = 168
          Top = 3
          Width = 61
          Height = 15
          Caption = 'DESCRICAO'
          FocusControl = dbDESCRICAO
        end
        object dbID: TDBEdit
          Left = 8
          Top = 19
          Width = 154
          Height = 23
          DataField = 'ID'
          DataSource = dsCRUD
          TabOrder = 0
        end
        object dbDESCRICAO: TDBEdit
          Left = 168
          Top = 19
          Width = 553
          Height = 23
          DataField = 'DESCRICAO'
          DataSource = dsCRUD
          TabOrder = 1
        end
        object Panel1: TPanel
          Left = 8
          Top = 48
          Width = 713
          Height = 207
          Anchors = [akLeft, akTop, akBottom]
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 2
          inline frameEditorHtml: TframeEditorHtml
            Left = 0
            Top = 0
            Width = 709
            Height = 203
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitTop = -275
            inherited mmHtml: TSynEdit
              Width = 709
              Height = 136
            end
            inherited wbHtml: TWebBrowser
              Width = 709
              Height = 136
              ControlData = {
                4C000000474900000E0E00000000000000000000000000000000000000000000
                000000004C000000000000000000000001000000E0D057007335CF11AE690800
                2B2E126208000000000000004C0000000114020000000000C000000000000046
                8000000000000000000000000000000000000000000000000000000000000000
                00000000000000000100000000000000000000000000000000000000}
            end
            inherited pTop: TPanel
              Width = 709
              inherited tbarFerramentas: TToolBar
                Width = 691
                ExplicitWidth = 691
              end
              inherited pControles: TPanel
                Width = 707
              end
            end
          end
        end
      end
    end
  end
  object cdsCRUD: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsCRUDAfterOpen
    AfterClose = cdsCRUDAfterClose
    AfterScroll = cdsCRUDAfterScroll
    Left = 80
    Top = 288
    object cdsCRUDID: TIntegerField
      FieldName = 'ID'
    end
    object cdsCRUDDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsCRUDINFORMACOES: TMemoField
      FieldName = 'INFORMACOES'
      Visible = False
      BlobType = ftMemo
    end
  end
  object dsCRUD: TDataSource
    AutoEdit = False
    DataSet = cdsCRUD
    OnStateChange = dsCRUDStateChange
    Left = 32
    Top = 288
  end
  object aclCRUD: TActionList
    Left = 136
    Top = 289
    object acIncluir: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Incluir'
      Hint = 'Incluir novo registro'
      ShortCut = 16462
      OnExecute = acIncluirExecute
    end
    object acEditar: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Editar'
      Hint = 'Editar registro atual'
      ShortCut = 16453
      OnExecute = acEditarExecute
    end
    object acApagar: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Apagar'
      Hint = 'Apagar o registro atual'
      ShortCut = 16430
      OnExecute = acApagarExecute
    end
    object acGravar: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Gravar'
      Hint = 'Gravar'
      ShortCut = 16397
      OnExecute = acGravarExecute
    end
    object acCancelar: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Cancelar'
      Hint = 'Cancelar modifica'#231#245'es'
      ShortCut = 49219
      OnExecute = acCancelarExecute
    end
    object acManutencao: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = 'acManuten'#231#227'o'
      Hint = 'Modo de manuten'#231#227'o'
      OnExecute = acManutencaoExecute
    end
    object acListagem: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Listagem'
      Hint = 'Lista de registros'
      ShortCut = 16392
      OnExecute = acListagemExecute
    end
    object acPesquisar: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Pesquisar'
      Hint = 'Executar pesquisa'
      ShortCut = 16505
    end
    object acOpcoes: TAction
      Category = 'CRUD Prim'#225'rio'
      Caption = '&Op'#231#245'es'
      Hint = 'Lista de op'#231#245'es'
    end
  end
end
