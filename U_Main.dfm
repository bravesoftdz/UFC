object F_Main: TF_Main
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'F_Main'
  ClientHeight = 605
  ClientWidth = 922
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -24
  Font.Name = 'Candara'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 29
  object Button1: TButton
    Left = 67
    Top = 59
    Width = 329
    Height = 153
    Caption = 'Rendez_vous'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 527
    Top = 394
    Width = 329
    Height = 153
    Caption = 'Fermer'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 527
    Top = 59
    Width = 329
    Height = 153
    Caption = 'Etiquette'
    TabOrder = 2
  end
  object Button4: TButton
    Left = 67
    Top = 394
    Width = 329
    Height = 153
    Caption = 'Param'#232'tre'
    TabOrder = 3
    OnClick = Button4Click
  end
end
