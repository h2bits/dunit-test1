program Project1Test;

uses
  Forms,
  TestFramework,
  GUITestRunner,
  Project1TestCases in 'Project1TestCases.pas';

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.
