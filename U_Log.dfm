object Log: TLog
  Left = 0
  Top = 0
  Caption = 'Log'
  ClientHeight = 330
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Candara'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 76
    Top = 169
    Width = 183
    Height = 21
    Cursor = crHandPoint
    Caption = 'Cr'#233'e un nouvelle compte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Label1Click
  end
  object Edit1: TEdit
    Left = 76
    Top = 57
    Width = 473
    Height = 29
    TabOrder = 0
    TextHint = 'Pseudo'
  end
  object Edit2: TEdit
    Left = 76
    Top = 121
    Width = 473
    Height = 29
    MaxLength = 14
    PasswordChar = '*'
    TabOrder = 1
    TextHint = 'Mot de Pass'
  end
  object Button1: TButton
    Left = 76
    Top = 217
    Width = 121
    Height = 57
    Caption = 'Valid'#233
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 428
    Top = 217
    Width = 121
    Height = 57
    Caption = 'Anuller'
    TabOrder = 3
    OnClick = Button2Click
  end
end
