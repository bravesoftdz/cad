{**
@Abstract ����� ���������� ��� Cad
@Author Prof1983 <prof1983@ya.ru>
@Created 02.07.2009
@LastMod 08.04.2013

     ===========
     | CadData |
     ===========
       |    |
---------  ---------------
| ABase |  | CadCoreBase |
---------  ---------------
}
unit CadData;

interface

uses
  Types,
  ABase,
  CadCoreBase;

const
  CAD_PRECISION_CHR: array[TCadPrecision] of APascalString = ('D', 'S', 'T');
  CAD_PRECISION_INT: array[TCadPrecision] of AInteger = (0, 1, 2);

type
  TBranchIrs = record
    BranchNum: Integer;    // 0 - ����� �����
    NodeNum1: Integer;     // 1 = Ex_Data_Uz[j,0] - ����� ���� ������ �����
    NodeNum2: Integer;     // 2 = Ex_Data_Uz[j,0] - ����� ���� ����� �����
    PlaNum: Integer;       // 3 = NomPla = Branch.Brn.ExtData3.Data1 - ������� ���
    PlaColor: Integer;     // 4 = Branch.Brn.ExtData3.Color - ���� ������� ���
    ArrowIsFresh: Integer; // 6 - ���� ������� (������, ���������) (0(False)-clBlue else 1(True)-clRed)
    LineType7: Integer;    // 7 - ��� ����� (1,14 - ���������� (���������)) // ��� ���������
    Name: string;          // ������������ �����
  end;

type
  TExDataNodeRec = record
    Nd0: Integer; // 0 - Items[I].NdNum - ����� ����
    Nd1: Integer; // 1 - Items[I].NdPnt.X - ���������� ����
    Nd2: Integer; // 2 - Items[I].NdPnt.Y - ���������� ����
    Nd3: Integer; // 3 - Items[I].NdPntZ - ���������� ����
    Nd4: Integer; // 4 - Items[I].NdType - ���� ����������� ��� ���
  end;

type
  TPolyRec = record
    {** ����� ������� � ������� Ex_Data_Branch }
    IndEx: Integer;
    {** ����� ����� ��������� }
    NumNode: Integer;
    PolyCoord: array of TPoint;
  end;

// --- Vars ---

var DrawFlag: AInt;

{** ��� ����� }
var DrawFileName: APascalString;

var IsModify: Boolean;

var CadImgPath: APascalString;

var StrokaUo: APascalString;

{** ��� ������������ ����� }
var OrigFileName: string;

var
  {** �������� ��������� }
  Ex_PolyLine: array of TPolyRec;
  {** ��������� ������������ ������� TablDavl � Row-2 }
  Ex_Data_Uz: array of TExDataNodeRec;
  {** ������� ������ ������ (Irs) }
  Ex_Data_Branch: array of TBranchIrs;

function CadPrecisionFromChar(const Value: AChar): TCadPrecision;
function CadPrecisionFromInt(Value: AInt): TCadPrecision;

implementation

function CadPrecisionFromChar(const Value: AChar): TCadPrecision;
var
  p: TCadPrecision;
begin
  for p := Low(p) to High(p) do
  begin
    if (CAD_PRECISION_CHR[p] = Value) then
    begin
      Result := p;
      Exit;
    end;
  end;
  Result := Precision0;
end;

function CadPrecisionFromInt(Value: AInt): TCadPrecision;
var
  p: TCadPrecision;
begin
  for p := Low(p) to High(p) do
  begin
    if (CAD_PRECISION_INT[p] = Value) then
    begin
      Result := p;
      Exit;
    end;
  end;
  Result := Precision0;
end;

end.
 