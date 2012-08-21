{**
@Abstract Cad.App data
@Author Prof1983 <prof1983@ya.ru>
@Created 02.07.2009
@LastMod 21.08.2012
}
unit CadAppData;

interface

uses
  ABase, AUiBase, CadAppBase, CadCoreBase, CadDrawBase;

var
  CadDataGrid: AStringGrid;

  {** ������� ���������� ������ }
  FCompileExtDataEvent: AEvent;

  FIsShowAllFigures: Boolean;

  NameSh_Text: APascalString;

  NameVar_Text: APascalString;

  FOnCompileExtData: AProc;

  {** ����������� ��� ������� ������ �� Xls ����� }
  FOnImportDataFromXls: CadApp_OnImportDataFromXls_Proc;

  FOnImportDataOk: CadApp_OnImportDataOk_Proc;

  FOnSaveFile: CadApp_OnSaveFile_Proc;

  {** ������� ����������� ��� ������������� � ������ � ������� ���������� ��������� �� ��������� �������
      Obj - ������� - ����� ������� (0-Branchs, 1-Nodes)
      Data - ����� �������� (�����/����) }
  FOnSetPosition: ACallbackProc;

  DocDirectory: APascalString;

  {** ���� ��������� ��������� � ������ �������� }
  DrawWin_IsClosing1: Boolean;

  {** ������� ���� }
  MainToolMenu: AToolMenu;

  {** ��� ����������� �����:
      0-���������� �������������,
      1-����������� �����,
      2-��������������� ������,
      3-����� � ������������� ��������,
      4-����� � �������� R }
  ViewMode: TCadAppViewMode;

  {** �������� ������� ��������� ������� }
  PaintBoxCanvas: ACanvas;

  {** ��������� � ������� ������ }
  TablData_IsModyfid: Boolean;

implementation

end.
