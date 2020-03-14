object frmPrinc: TfrmPrinc
  Left = 0
  Top = 0
  Caption = 'Editor Html'
  ClientHeight = 309
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object rbtArquivo: TRadioButton
    Left = 24
    Top = 24
    Width = 113
    Height = 17
    Caption = 'Editar arquivo'
    TabOrder = 0
  end
  object edtArquivo: TJvFilenameEdit
    Left = 24
    Top = 47
    Width = 505
    Height = 23
    TabOrder = 1
    Text = ''
  end
  object rbtTexto: TRadioButton
    Left = 24
    Top = 96
    Width = 113
    Height = 17
    Caption = 'Editar texto'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object mmTexto: TMemo
    Left = 24
    Top = 119
    Width = 505
    Height = 114
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Button1: TButton
    Left = 232
    Top = 256
    Width = 95
    Height = 27
    Cursor = crHandPoint
    Caption = 'Editar'
    TabOrder = 4
    OnClick = Button1Click
  end
end
