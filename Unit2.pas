unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.ExtCtrls,
  Vcl.OleCtrls,WMPLib_TLB;

type
  TForm2 = class(TForm)
    Panel4: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure ComboBox1DblClick(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
  private
    { Private 宣言 }
    wm:TWindowsMediaPlayer;
  public
    { Public 宣言 }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1,
     ShlObj;




procedure TForm2.ComboBox1DblClick(Sender: TObject);
begin
  if (ComboBox2.Text = 'デスクトップ') or (ComboBox2.Text = 'ﾃﾞｽｸﾄｯﾌﾟ') then begin
    DirectoryListBox1.Directory := Form1.GetSpecialFolder(CSIDL_DESKTOP);
  end else
  if (ComboBox2.Text = 'ドキュメント') or (ComboBox2.Text = 'ﾄﾞｷｭﾒﾝﾄ') then begin
    DirectoryListBox1.Directory := Form1.GetSpecialFolder(CSIDL_MYDOCUMENTS);
  end else begin
    DirectoryListBox1.Directory := ComboBox1.Text;
  end;

end;

procedure TForm2.DirectoryListBox1Change(Sender: TObject);
begin
  ComboBox2.Text := DirectoryListBox1.Directory;
end;

procedure TForm2.FileListBox1Click(Sender: TObject);
begin
  wm.URL := FileListBox1.FileName;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  wm := WMPLib_TLB.TWindowsMediaPlayer.Create(self);
  wm.Parent := panel2;
  wm.Visible := true;
  wm.Align := alClient;
end;

end.
