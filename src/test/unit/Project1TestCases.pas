unit Project1TestCases;

interface

uses
  TestFramework,
  Classes;

type
  TTestCaseFirst = class(TTestCase)
  private
    FStrList: TStringList;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestFirst;
    procedure TestSecond;
    procedure TestThird;
    procedure TestPopulateStringList;
    procedure TestSortStringList;
  end;

implementation

procedure TTestCaseFirst.SetUp;
begin
  FStrList := TStringList.Create;
end;

procedure TTestCaseFirst.TearDown;
begin
  FStrList.Free;
end;

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

procedure TTestCaseFirst.TestPopulateStringList;
var
  I: Integer;
begin
  Check(FStrList.Count = 0);
  for I := 1 to 50 do
    FStrList.Add('i');
  Check(FStrList.Count = 50);
end;

procedure TTestCaseFirst.TestSortStringList;
begin
  Check(FStrList.Sorted = False);
  Check(FStrList.Count = 0);
  FStrList.Add('You');
  FStrList.Add('Love');
  FStrList.Add('I');
  FStrList.Sorted := True;
  Check(FStrList[2] = 'You');
  Check(FStrList[1] = 'Love');
  Check(FStrList[0] = 'I');
end;

initialization
  TestFramework.RegisterTest(TTestCaseFirst.Suite);
end.
