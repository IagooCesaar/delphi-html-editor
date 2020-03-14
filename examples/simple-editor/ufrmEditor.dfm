object frmEditor: TfrmEditor
  Left = 0
  Top = 0
  Caption = 'Editor'
  ClientHeight = 362
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 614
    Height = 309
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 620
    ExplicitHeight = 321
    inline frameEditorHtml: TframeEditorHtml
      Left = 0
      Top = 0
      Width = 610
      Height = 305
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = -24
      ExplicitTop = -173
      inherited mmHtml: TSynEdit
        Width = 610
        Height = 238
      end
      inherited wbHtml: TWebBrowser
        Width = 610
        Height = 238
        ControlData = {
          4C0000000C3F0000991800000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      inherited pTop: TPanel
        Width = 610
        inherited tbarFerramentas: TToolBar
          Width = 592
        end
        inherited pControles: TPanel
          Width = 608
        end
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 318
    Width = 614
    Height = 41
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 321
    ExplicitWidth = 620
    object btnModeloCancelar: TButton
      AlignWithMargins = True
      Left = 507
      Top = 5
      Width = 95
      Height = 27
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 8
      Margins.Bottom = 5
      Align = alRight
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btnModeloCancelarClick
      ExplicitLeft = 535
    end
  end
end
