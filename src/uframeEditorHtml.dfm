object frameEditorHtml: TframeEditorHtml
  Left = 0
  Top = 0
  Width = 634
  Height = 478
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object mmHtml: TSynEdit
    Left = 0
    Top = 67
    Width = 634
    Height = 411
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Visible = False
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.ShowCollapsedLine = True
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    UseCodeFolding = False
    BorderStyle = bsNone
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Highlighter = synhtmlsynHighLight
    Lines.Strings = (
      'mmHtml')
    ReadOnly = True
    WordWrap = True
    FontSmoothing = fsmNone
  end
  object wbHtml: TWebBrowser
    Left = 0
    Top = 67
    Width = 634
    Height = 411
    Align = alClient
    TabOrder = 1
    OnCommandStateChange = wbHtmlCommandStateChange
    ExplicitLeft = 3
    ExplicitTop = 68
    ControlData = {
      4C000000874100007A2A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 67
    Align = alTop
    Caption = 'pTop'
    ShowCaption = False
    TabOrder = 2
    object tbarFerramentas: TToolBar
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 616
      Height = 24
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      ButtonWidth = 24
      Caption = 'tbarFerramentas'
      Images = dmImagens.imgIcoEditores
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object btnAbrir: TToolButton
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Action = acAbrir
      end
      object btnSalvar: TToolButton
        Left = 24
        Top = 0
        Cursor = crHandPoint
        Action = acSalvar
      end
      object btnPublicar: TToolButton
        Left = 48
        Top = 0
        Cursor = crHandPoint
        Action = acPublicar
      end
      object btnSep1: TToolButton
        Left = 72
        Top = 0
        Width = 8
        Caption = 'btnSep1'
        ImageIndex = 21
        Style = tbsSeparator
      end
      object btnNegrito: TToolButton
        Left = 80
        Top = 0
        Cursor = crHandPoint
        Action = acNegrito
      end
      object btnItalico: TToolButton
        Left = 104
        Top = 0
        Cursor = crHandPoint
        Action = acItalico
      end
      object btnSublinhado: TToolButton
        Left = 128
        Top = 0
        Cursor = crHandPoint
        Action = acSublinhado
      end
      object btnCorFonte: TToolButton
        Left = 152
        Top = 0
        Cursor = crHandPoint
        Action = acCorFonte
      end
      object btnRealce: TToolButton
        Left = 176
        Top = 0
        Cursor = crHandPoint
        Action = acCorRealce
      end
      object btnCorFundo: TToolButton
        Left = 200
        Top = 0
        Cursor = crHandPoint
        Action = acCorFundo
      end
      object btnListaOrd: TToolButton
        Left = 224
        Top = 0
        Cursor = crHandPoint
        Action = acListaOrd
      end
      object btnListaNaoOrd: TToolButton
        Left = 248
        Top = 0
        Cursor = crHandPoint
        Action = acListaNaoOrd
      end
      object btnRecuoDiminuir: TToolButton
        Left = 272
        Top = 0
        Cursor = crHandPoint
        Action = acRecuoReduzir
      end
      object btnRecuoAumentar: TToolButton
        Left = 296
        Top = 0
        Cursor = crHandPoint
        Action = acRecuoAumentar
      end
      object btnAlinharEsquerda: TToolButton
        Left = 320
        Top = 0
        Cursor = crHandPoint
        Action = acAlinEsquerda
      end
      object btnAlinharCentro: TToolButton
        Left = 344
        Top = 0
        Cursor = crHandPoint
        Action = acAlinCentro
      end
      object btnAlinharDireita: TToolButton
        Left = 368
        Top = 0
        Cursor = crHandPoint
        Action = acAlinDireita
      end
      object btnLinhaHorizontal: TToolButton
        Left = 392
        Top = 0
        Cursor = crHandPoint
        Action = acLinhaHorizontal
      end
      object btnSep2: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'btnSep2'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object btnRecortar: TToolButton
        Left = 424
        Top = 0
        Cursor = crHandPoint
        Action = acCortar
      end
      object btnCopiar: TToolButton
        Left = 448
        Top = 0
        Cursor = crHandPoint
        Action = acCopiar
      end
      object btnColar: TToolButton
        Left = 472
        Top = 0
        Cursor = crHandPoint
        Action = acColar
      end
      object btnDesfazer: TToolButton
        Left = 496
        Top = 0
        Cursor = crHandPoint
        Action = acDesfazer
      end
      object btnSep3: TToolButton
        Left = 520
        Top = 0
        Width = 8
        Caption = 'btnSep3'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object btnHiperlink: TToolButton
        Left = 528
        Top = 0
        Cursor = crHandPoint
        Action = acHyperlink
      end
      object btnTabela: TToolButton
        Left = 552
        Top = 0
        Cursor = crHandPoint
        Action = acTabela
      end
      object btnSep4: TToolButton
        Left = 576
        Top = 0
        Width = 8
        Caption = 'btnSep4'
        ImageIndex = 20
        Style = tbsSeparator
      end
    end
    object pControles: TPanel
      Left = 1
      Top = 36
      Width = 632
      Height = 30
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pControles'
      ShowCaption = False
      TabOrder = 1
      object cmbFonte: TJvFontComboBox
        Left = 8
        Top = 3
        Width = 121
        Height = 22
        DroppedDownWidth = 121
        MaxMRUCount = 0
        FontName = 'Calibri'
        ItemIndex = 32
        Sorted = False
        TabOrder = 0
        OnChange = cmbFonteChange
      end
      object cmbFonteTam: TJvComboBox
        Left = 135
        Top = 3
        Width = 145
        Height = 23
        Style = csDropDownList
        TabOrder = 1
        Text = 'M'#233'dia'
        OnChange = cmbFonteTamChange
        Items.Strings = (
          'Pequena'
          'M'#233'dia'
          'Normal'
          'Maior'
          'Grande'
          'Extra Grande')
        ItemIndex = 1
      end
      object chbVerCodigo: TJvCheckBox
        AlignWithMargins = True
        Left = 286
        Top = 3
        Width = 78
        Height = 17
        Cursor = crHandPoint
        Caption = 'Ver c'#243'digo'
        TabOrder = 2
        OnClick = chbVerCodigoClick
        LinkedControls = <>
      end
    end
  end
  object dlgColorColor: TColorDialog
    Left = 208
    Top = 72
  end
  object aclAcoes: TActionList
    Images = dmImagens.imgIcoEditores
    Left = 16
    Top = 72
    object acNegrito: TAction
      Caption = 'acNegrito'
      Hint = 'Negrio'
      ImageIndex = 0
      OnExecute = acNegritoExecute
    end
    object acItalico: TAction
      Caption = 'acItalico'
      Hint = 'It'#225'lico'
      ImageIndex = 1
      OnExecute = acItalicoExecute
    end
    object acSublinhado: TAction
      Caption = 'acSublinhado'
      Hint = 'Sublinhado'
      ImageIndex = 2
      OnExecute = acSublinhadoExecute
    end
    object acCorFonte: TAction
      Caption = 'acCorFonte'
      Hint = 'Cor da fonte'
      ImageIndex = 3
      OnExecute = acCorFonteExecute
    end
    object acCorRealce: TAction
      Caption = 'acCorRealce'
      Hint = 'Cor de realce'
      ImageIndex = 23
      OnExecute = acCorRealceExecute
    end
    object acCorFundo: TAction
      Caption = 'acCorFundo'
      Hint = 'Cor de fundo'
      ImageIndex = 24
      OnExecute = acCorFundoExecute
    end
    object acListaOrd: TAction
      Caption = 'acListaOrd'
      Hint = 'Lista ordenada'
      ImageIndex = 4
      OnExecute = acListaOrdExecute
    end
    object acListaNaoOrd: TAction
      Caption = 'acListaNaoOrd'
      Hint = 'Lista n'#227'o ordenada'
      ImageIndex = 5
      OnExecute = acListaNaoOrdExecute
    end
    object acRecuoReduzir: TAction
      Caption = 'acRecuoReduzir'
      Hint = 'Reduzir recuo'
      ImageIndex = 6
      OnExecute = acRecuoReduzirExecute
    end
    object acRecuoAumentar: TAction
      Caption = 'acRecuoAumentar'
      Hint = 'Aumentar recuo'
      ImageIndex = 7
      OnExecute = acRecuoAumentarExecute
    end
    object acAlinEsquerda: TAction
      Caption = 'acAlinEsquerda'
      Hint = 'Alinhar '#224' esquerda'
      ImageIndex = 8
      OnExecute = acAlinEsquerdaExecute
    end
    object acAlinCentro: TAction
      Caption = 'acAlinCentro'
      Hint = 'Alinhar ao centro'
      ImageIndex = 9
      OnExecute = acAlinCentroExecute
    end
    object acAlinDireita: TAction
      Caption = 'acAlinDireita'
      Hint = 'Alinhar '#224' direita'
      ImageIndex = 10
      OnExecute = acAlinDireitaExecute
    end
    object acGaleriaImagens: TAction
      Caption = 'acGaleriaImagens'
      ImageIndex = 11
      OnExecute = acGaleriaImagensExecute
    end
    object acBancodeImagens: TAction
      Caption = 'acBancodeImagens'
      ImageIndex = 11
      OnExecute = acBancodeImagensExecute
    end
    object acLinhaHorizontal: TAction
      Caption = 'acLinhaHorizontal'
      Hint = 'Linha horizontal'
      ImageIndex = 12
      OnExecute = acLinhaHorizontalExecute
    end
    object acCortar: TAction
      Caption = 'acCortar'
      Hint = 'Cortar'
      ImageIndex = 13
      OnExecute = acCortarExecute
    end
    object acCopiar: TAction
      Caption = 'acCopiar'
      Hint = 'Copiar'
      ImageIndex = 14
      OnExecute = acCopiarExecute
    end
    object acColar: TAction
      Caption = 'acColar'
      Hint = 'Colar'
      ImageIndex = 15
      OnExecute = acColarExecute
    end
    object acDesfazer: TAction
      Caption = 'acDesfazer'
      Hint = 'Desfazer'
      ImageIndex = 16
      OnExecute = acDesfazerExecute
    end
    object acHyperlink: TAction
      Caption = 'acHyperlink'
      Hint = 'Inserir hyperlink'
      ImageIndex = 17
      OnExecute = acHyperlinkExecute
    end
    object acTabela: TAction
      Caption = 'Tabela'
      Hint = 'Inserir tabela'
      ImageIndex = 19
      OnExecute = acTabelaExecute
    end
    object acSalvar: TAction
      Caption = 'Salvar'
      Hint = 'Salvar'
      ImageIndex = 18
      OnExecute = acSalvarExecute
    end
    object acPublicar: TAction
      Caption = 'Publicar'
      Hint = 'Publicar'
      ImageIndex = 20
    end
    object acAbrir: TAction
      Caption = 'acAbrir'
      Hint = 'Abrir'
      ImageIndex = 22
      OnExecute = acAbrirExecute
    end
  end
  object synhtmlsynHighLight: TSynHTMLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 279
    Top = 72
  end
  object dlgSaveHtml: TSaveDialog
    Filter = 'Documento Html|*.htm'
    Left = 128
    Top = 72
  end
  object dlgOpenHtml: TOpenDialog
    Filter = 'Documento Html|*.htm'
    Left = 64
    Top = 72
  end
end
