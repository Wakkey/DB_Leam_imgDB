object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 412
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 412
    Align = alLeft
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 263
      Height = 29
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 59
        Height = 13
        Caption = #12479#12452#12488#12523#19968#35239
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 30
      Width = 263
      Height = 381
      Align = alClient
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'no'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'title'
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 265
    Top = 0
    Width = 380
    Height = 412
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 378
      Height = 72
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 376
        Height = 13
        Align = alTop
        Caption = #12479#12452#12488#12523
        ExplicitWidth = 35
      end
      object Button2: TButton
        Left = 104
        Top = 41
        Width = 75
        Height = 25
        Caption = #12524#12467#12540#12489#21066#38500
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 4
        Top = 41
        Width = 75
        Height = 25
        Caption = #12524#12467#12540#12489#36861#21152
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 216
        Top = 41
        Width = 97
        Height = 25
        Caption = #30011#20687'/'#21205#30011#36984#25246
        TabOrder = 2
        OnClick = Button3Click
      end
      object Edit1: TEdit
        Left = 1
        Top = 14
        Width = 376
        Height = 21
        Align = alTop
        TabOrder = 3
      end
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=m0jpw10p;Persist Security Info=True;' +
      'User ID=yuhi;Data Source=mysql53'
    Left = 208
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 206
    Top = 208
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM yuhi.pic_db;')
    Left = 302
    Top = 120
  end
end
