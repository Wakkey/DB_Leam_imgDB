object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #12513#12487#12451#12450#12501#12449#12452#12523#65288#30011#20687#12289#21205#30011#65289#12398#36984#25246
  ClientHeight = 424
  ClientWidth = 499
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
  object Panel4: TPanel
    Left = 0
    Top = 384
    Width = 499
    Height = 40
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 400
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 304
      Top = 6
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 384
    Align = alClient
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 257
      Height = 382
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 255
        Height = 42
        Align = alTop
        Caption = 'Panel1'
        TabOrder = 0
        object ComboBox1: TComboBox
          Left = 1
          Top = 22
          Width = 253
          Height = 21
          Align = alClient
          TabOrder = 0
          Text = '*.bmp;*.jpg;*.tiff;*.avi;*.wmv;*.mp2;*.mp3;**mp4'
          OnDblClick = ComboBox1DblClick
          OnEnter = ComboBox1DblClick
          Items.Strings = (
            '*.bmp;*.jpg;*.tiff;*.avi;*.wmv;*.mp2;*.mp3;*.mp4'
            '*.bmp'
            '*.jpg'
            '*.tiff'
            '*.avi'
            '*.wmv'
            '*.mp2'
            '*.mp3'
            '*.mp4')
        end
        object ComboBox2: TComboBox
          Left = 1
          Top = 1
          Width = 253
          Height = 21
          Align = alTop
          TabOrder = 1
          Text = #12487#12473#12463#12488#12483#12503
          OnDblClick = ComboBox1DblClick
          OnEnter = ComboBox1DblClick
          Items.Strings = (
            #12487#12473#12463#12488#12483#12503
            #12489#12461#12517#12513#12531#12488)
        end
      end
      object DirectoryListBox1: TDirectoryListBox
        Left = 1
        Top = 43
        Width = 123
        Height = 338
        Align = alLeft
        FileList = FileListBox1
        TabOrder = 1
        OnChange = DirectoryListBox1Change
      end
      object FileListBox1: TFileListBox
        Left = 124
        Top = 43
        Width = 132
        Height = 338
        Align = alClient
        ItemHeight = 13
        Mask = '*.bmp;*.jpg;*.tiff;*.avi;*.wmv;*.mp2;*.mp3;*.mp4'
        TabOrder = 2
        OnClick = FileListBox1Click
      end
    end
    object Panel2: TPanel
      Left = 258
      Top = 1
      Width = 240
      Height = 382
      Align = alClient
      TabOrder = 1
    end
  end
end
