program hanoiTowerApp;

uses
  Forms,
  HanoiTower in 'HanoiTower.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Hanoi Tower';
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
