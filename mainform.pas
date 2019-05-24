unit mainform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TMain = class(TForm)
    BPMList: TListBox;
    BPMCounterBox: TGroupBox;
    TimeLabel: TLabel;
    BPMLabel: TLabel;
    BeatCountLabel: TLabel;
    BPM: TEdit;
    BeatCount: TEdit;
    Beat: TButton;
    Reset: TButton;
    Time: TEdit;
    Time_: TEdit;
    TimeTimer: TTimer;
    AutoStop: TTimer;
    InformationBox: TGroupBox;
    InfoTitle: TEdit;
    InfoTitleLabel: TLabel;
    InfoArtist: TEdit;
    InfoArtistLabel: TLabel;
    Timer: TTimer;
    InfoBPM: TEdit;
    InfoBPMLabel: TLabel;
    Save: TButton;
    procedure TimeTimerTimer(Sender: TObject);
    procedure BeatClick(Sender: TObject);
    procedure CarryOn;
    procedure AutoStopTimer(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.DFM}

procedure TMain.TimeTimerTimer(Sender: TObject);
var
x, y, ans: double;
errcode : integer;
begin
   Val(Time_.Text, x, errcode );
   Val('1000', y, errcode );
   if errcode <> 0 then
   else
   begin
   ans := x + y;
   Time_.Text := FloatToStr(ans);
   Time.Text := FloatToStr(ans / 1000);
   end;
end;

procedure TMain.BeatClick(Sender: TObject);
begin
   if Beat.Tag = 0 then
   Beat.Tag := 1
   else
   begin
   TimeTimer.Enabled := True;
   CarryOn;
   end;
end;

procedure TMain.CarryOn;
var
a, x, y, z, answer: double;
errcode : integer;
begin
  AutoStop.Enabled := False;
   Val(BeatCount.Text, x, errcode );
   Val(BPM.Text, y, errcode );
   Val(Time.Text, z, errcode );
   if errcode <> 0 then
   else
   begin
   BeatCount.Text := FloatToStr(x + 1);
   answer := x * 60 / z;
   a := y + answer;
   BPM.Text := FloatToStr(a / 2);
   end;
  AutoStop.Enabled := True;
end;

procedure TMain.AutoStopTimer(Sender: TObject);
begin
  Beat.Enabled := False;
  TimeTimer.Enabled := False;
end;

procedure TMain.ResetClick(Sender: TObject);
begin
  Time.Text := '';
  Time_.Text := '';
  BPM.Text := '';
  BeatCount.Text := '';
  InfoTitle.Text := '';
  InfoArtist.Text := '';
  TimeTimer.Enabled := False;
  AutoStop.Enabled := False;
  Beat.Enabled := True;
  Beat.SetFocus;
end;

procedure TMain.TimerTimer(Sender: TObject);
begin
   InfoBPM.Text := BPM.Text;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
   BPMList.Items.LoadFromFile('bpm.list');
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   BPMList.Items.SaveToFile('bpm.list');
end;

procedure TMain.SaveClick(Sender: TObject);
begin
  BPMList.Items.Add(InfoBPM.Text + '     ' + InfoTitle.Text + ' - ' + InfoArtist.Text);
end;

end.
