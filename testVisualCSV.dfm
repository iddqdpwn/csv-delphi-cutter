object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CSV'
  ClientHeight = 379
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 438
    Top = 319
    Width = 170
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082' '#1082' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1102':'
  end
  object Label3: TLabel
    Left = 438
    Top = 158
    Width = 154
    Height = 13
    Caption = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1089#1090#1086#1083#1073#1094#1091' '#8470
  end
  object Label2: TLabel
    Left = 438
    Top = 63
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 82
    Height = 13
    Caption = #1060#1072#1081#1083' '#1085#1077' '#1074#1099#1073#1088#1072#1085
  end
  object Button1: TButton
    Left = 438
    Top = 32
    Width = 240
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' *.csv '#1092#1072#1081#1083
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 32
    Width = 424
    Height = 330
    ColCount = 4
    DefaultColWidth = 104
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
  end
  object Save: TButton
    Left = 438
    Top = 338
    Width = 240
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = SaveClick
  end
  object Edit1: TEdit
    Left = 616
    Top = 314
    Width = 62
    Height = 21
    TabOrder = 3
    Text = '1'
  end
  object ComboBox1: TComboBox
    Left = 616
    Top = 155
    Width = 62
    Height = 21
    TabOrder = 4
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
  end
  object Button2: TButton
    Left = 438
    Top = 182
    Width = 240
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 5
    OnClick = Button2Click
  end
end
