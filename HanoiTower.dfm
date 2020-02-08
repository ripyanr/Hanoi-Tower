object Form2: TForm2
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form2'
  ClientHeight = 504
  ClientWidth = 619
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object shtiang_A: TShape
    Left = 136
    Top = 152
    Width = 12
    Height = 240
    Hint = 'Balok A'
    ParentShowHint = False
    Pen.Color = clSilver
    Pen.Style = psClear
    Shape = stRoundRect
    ShowHint = True
  end
  object shblk_3: TShape
    Left = 48
    Top = 320
    Width = 193
    Height = 64
    Hint = 'Balok A'
    ParentShowHint = False
    Pen.Color = clSilver
    Pen.Style = psClear
    Shape = stRoundRect
    ShowHint = True
  end
  object shblk_2: TShape
    Left = 88
    Top = 250
    Width = 121
    Height = 64
    Hint = 'Balok A'
    ParentShowHint = False
    Pen.Color = clSilver
    Pen.Style = psClear
    Shape = stRoundRect
    ShowHint = True
  end
  object shblk_1: TShape
    Left = 111
    Top = 180
    Width = 64
    Height = 64
    Hint = 'Balok A'
    ParentShowHint = False
    Pen.Color = clSilver
    Pen.Style = psClear
    Shape = stRoundRect
    ShowHint = True
  end
  object shAlas: TShape
    Left = 48
    Top = 390
    Width = 521
    Height = 12
    Hint = 'Balok A'
    ParentShowHint = False
    Pen.Color = clSilver
    Pen.Style = psClear
    Shape = stRoundRect
    ShowHint = True
  end
  object shtiang_B: TShape
    Left = 306
    Top = 152
    Width = 12
    Height = 240
    Hint = 'Balok A'
    ParentShowHint = False
    Pen.Color = clSilver
    Pen.Style = psClear
    Shape = stRoundRect
    ShowHint = True
  end
  object shtiang_C: TShape
    Left = 477
    Top = 152
    Width = 12
    Height = 240
    Hint = 'Balok A'
    ParentShowHint = False
    Pen.Color = clSilver
    Pen.Style = psClear
    Shape = stRoundRect
    ShowHint = True
  end
  object sp_A: TSpeedButton
    Left = 40
    Top = 408
    Width = 193
    Height = 49
    Caption = 'A'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sp_AClick
  end
  object sp_B: TSpeedButton
    Left = 216
    Top = 408
    Width = 193
    Height = 49
    Caption = 'B'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sp_BClick
  end
  object sp_C: TSpeedButton
    Left = 376
    Top = 408
    Width = 193
    Height = 49
    Caption = 'C'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sp_CClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 144
    Top = 56
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer2Timer
    Left = 184
    Top = 56
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer3Timer
    Left = 224
    Top = 56
  end
end
