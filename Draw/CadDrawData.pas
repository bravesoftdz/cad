{**
@Author Prof1983 <prof1983@ya.ru>
@Created 12.07.2011
@LastMod 22.03.2013
}
unit CadDrawData;

interface

uses
  Types,
  ABase,
  ABaseTypes,
  CadDrawBase;

var
  {** ���� ���� }
  BackColor1: AColor;
  {** True -> Pic; False -> UO }
  IsPic1: Boolean;
  {** ������ � ������� �������� }
  PicIndex1: Integer;
  {** ��� ����� � ��������� (PicName1) - ����������? }
  PicName_: string;
  {** ��������� ����� }
  P01: TPoint;
  P02: TPoint;
  PolyPoints: Integer;
  MouseDrag: Boolean;
  {** ������ ��������� ���������� ���� }
  OldXY: TPoint;
  PhotoPathDefault: Boolean;
  PhotoPathStr: string;
  PlaPathStr: string;
  IsSxema3D: Boolean;
  UgolXg: Real;
  UgolZg: Real;

  {** ������� ����������� ��� ������������ ������� ������� (��� ��������� ���) }
  FOnEnableTimer: AProc;
  {** ������� ��� ��������� ������ }
  FOnStampDraw: TStampDrawProc;

implementation

end.
 