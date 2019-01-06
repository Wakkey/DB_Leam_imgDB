unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ExtDlgs,WMPLib_TLB,
  Data.Win.ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private êÈåæ }
    Data_str:string;
    PIC_str:string;
    delete_tmp:string;
    wm:TWindowsMediaPlayer;
  public
    { Public êÈåæ }
    function GetSpecialFolder(Folder :integer):string;
    procedure DecodeFile(Fname,Data:ansistring);
    function EncodeFile(fName:string):string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2,
     System.Threading, EncdDecd, FileCtrl,IOUtils,Types,ShlObj;

function Tform1.EncodeFile(fName:string):string;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  Stream.LoadFromFile(fName);
  EncodeFile := EncodeBase64(Stream.Memory, stream.Size);
  Stream.Free;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
  fname,data:string;
  Task1: ITask;
begin
  fname := ADOQuery1.FieldByName('dataname').AsString;
  data := ADOQuery1.FieldByName('data').AsString;

  DecodeFile(
    ExtractFilePath(ParamStr(0))+ fname,
    data
  );
  wm.URL := ExtractFilePath(ParamStr(0))+ fname;
  Task1 := TTask.Create (procedure ()
  begin
    sleep(5000);
    wm.close;
  if not DeleteFile(ExtractFilePath(ParamStr(0))+ fname) then
    showmessage('àÍéûÉtÉ@ÉCÉãÇçÌèúÇ≈Ç´Ç‹ÇπÇÒÇ≈ÇµÇΩ');

  end);
  Task1.Start;

end;

procedure TForm1.DecodeFile(Fname,Data:ansistring);
var
  Stream: TFileStream;
  B: TBytes;
begin
  Stream := TFileStream.Create(Fname, fmCreate);
  B := DecodeBase64(Data);
  Stream.Write(B[0], Length(B));
  Stream.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  wm := WMPLib_TLB.TWindowsMediaPlayer.Create(self);
  wm.Parent := panel2;
  wm.Visible := true;
  wm.Align := alClient;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.pic_db WHERE bool_delete=false;';
  ADOQuery1.Open;
end;

function TForm1.GetSpecialFolder(Folder :integer):string;
var
  Path: array[0..MAX_PATH] of Char;
  pidl: PItemIDList;
begin
  SHGetSpecialFolderLocation(Application.Handle,Folder,pidl);
  SHGetPathFromIDList(pidl,Path);
  Result :=Path;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  no:integer;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.pic_db';
  ADOQuery1.Open;
  no := ADOQuery1.RecordCount;

  ADOQuery1.Close;

  ADOQuery1.SQL.Text := 'INSERT INTO YUHI.PIC_DB(NO,TITLE,DATA,DATANAME,bool_delete) VALUES('+
    no.ToString + ' , "' +
    Edit1.Text + '" , "' +
    PIC_str + '" , "' +
    Data_str + '" , ' +
    'false' +
  ')';

  ADOQuery1.ExecSQL;

  ADOQuery1.Close;
  DeleteFile(ExtractFilePath(ParamSTR(0)) + Data_str);


  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.pic_db WHERE bool_delete=false;';

  ADOQuery1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  no:integer;
begin
  no := ADOQuery1.FieldByName('NO').AsInteger;

  ADOQuery1.Close;

  ADOQuery1.SQL.Text := 'UPDATE YUHI.PIC_DB SET bool_delete=true WHERE NO=' +
    no.ToString +
  ';';

  ADOQuery1.ExecSQL;

  ADOQuery1.Close;

  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.pic_db WHERE bool_delete=false;';

  ADOQuery1.Open;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Frm:TForm2;
begin
  Frm := Tform2.Create(Self);
  Frm.ShowModal;
  Data_str := ExtractFileName(Frm.FileListBox1.FileName);
  Pic_str := EncodeFile(Data_str);
  Frm.Free;
end;

end.
