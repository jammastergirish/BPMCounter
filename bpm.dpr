program bpm;

uses
  Forms,
  mainform in 'mainform.pas' {Main};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'BPM Counter';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
