program Project1Test;

uses
  Forms,
  TestFramework,
  GUITestRunner;

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.
