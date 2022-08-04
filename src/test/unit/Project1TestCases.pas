unit Project1TestCases;

interface

uses
  TestFramework;

type
  TTestCaseFirst = class(TTestCase)
  published
    procedure TestFirst;
    procedure TestSecond;
    procedure TestThird;
  end;

implementation

procedure TTestCaseFirst.TestFirst;
begin
  Check(1 + 1 = 2, 'Catastrophic arithmetic failure!');
end;

procedure TTestCaseFirst.TestSecond;
begin
  Check(1 + 1 = 3, 'Deliberate failure');
end;

procedure TTestCaseFirst.TestThird;
var
  I: Integer;
begin
  I := 0;
  Check(1 div I = I, 'Deliberate exception');
end;

initialization
  TestFramework.RegisterTest(TTestCaseFirst.Suite);
end.
