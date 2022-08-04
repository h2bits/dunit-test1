unit Project1TestCases;

interface

uses
  TestFramework,
  Classes;

type
  TTestArithmetic = class(TTestCase)
  published
    procedure TestFirst;
    procedure TestSecond;
    procedure TestThird;
  end;

  TTestStringList = class(TTestCase)
  private
    FStrList: TStringList;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestPopulateStringList;
    procedure TestSortStringList;
  end;

implementation

procedure TTestArithmetic.TestFirst;
begin
  Check(1 + 1 = 2, 'Catastrophic arithmetic failure!');
end;

procedure TTestArithmetic.TestSecond;
begin
  Check(1 + 1 = 3, 'Deliberate failure');
end;

procedure TTestArithmetic.TestThird;
var
  I: Integer;
begin
  I := 0;
  Check(1 div I = I, 'Deliberate exception');
end;

procedure TTestStringList.SetUp;
begin
  FStrList := TStringList.Create;
end;

procedure TTestStringList.TearDown;
begin
  FStrList.Free;
end;

procedure TTestStringList.TestPopulateStringList;
var
  I: Integer;
begin
  Check(FStrList.Count = 0);
  for I := 1 to 50 do
    FStrList.Add('i');
  Check(FStrList.Count = 50);
end;

procedure TTestStringList.TestSortStringList;
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
  RegisterTest('Simple suite', TTestArithmetic.Suite);
  RegisterTest('Simple suite', TTestStringList.Suite);
end.
