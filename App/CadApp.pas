{**
@Abstract Cad.App
@Author Prof1983 <prof1983@ya.ru>
@Created 30.11.2009
@LastMod 11.04.2013
}
unit CadApp;

{$IFDEF HomeCad}{$DEFINE NoVcl}{$ENDIF}

{$ifndef NoVcl}
  {$define Vcl}
{$endif}

interface

uses
  Types,
  ABase,
  ABaseTypes,
  AUiBase,
  CadAppBase,
  CadAppDataUtils,
  CadCoreBase,
  CadDrawBase;

{** ����������� ������� ������ }
function CalcVisible(): AError; stdcall;

function CreateNewProject(): AError; stdcall;

{** ������� ������ ��� }
function DrawPla(): AError; stdcall;

{** ������������ ������ CadApp }
function Fin(): AError; stdcall;

{** ���������� ����� ������ �� ������ ����� }
function FindBranchByNum(BranchNum: AInt): AInt; stdcall;

{** ���������� ����� ������ ��� ���� NodeNum }
function FindNodeByNum(NodeNum: AInt): AInt; stdcall;

{** ���������� ������ ��������� ���� }
function GetCurrentLayerIndex(): AInt; stdcall;

function GetMaxViewPort(): TRect; stdcall;

{** �������������� ������ CadApp }
function Init(): AError; stdcall;

{** ����� �������� ��� ������� � ������� }
function InputPic(): ABool; stdcall;

{** ����������� ������ �� ����� ������ }
function ImportDan(): AError; stdcall;

{** ��������� ���� }
function LoadFileExP(const FileName: APascalString; FileType: AInt; IsAll: ABool): ABool;

{** ��������� ���� }
function LoadFileP(const FileName: APascalString): AError;

{** �������� ������ ����� ����� }
function Open2(DefFilterIndex: AInt; IsAll: ABool): ABool; stdcall;

{** �������������� ����� �������������� }
function Prepare(): AInt; stdcall;

{** ��������� ����� � ������ � ����
    @param FileName - ��� ������������ �����
    @param StrokaDan - ������ � �������
    @param StrokaUO - ������ � ��������� �������� �����������
    @param Version - ������ ����� ��� ���������� }
function SaveFileExP(const FileName, StrokaDan, StrokaUO: APascalString; Version: AInt): AError;

{** ������ ��������� ����� ��������, ��������� �� �������������� ������ ������ � ������� ������,
    ��������� ������� ����������� ����� �� ������ ����� }
function SelectBranch(BranchNum: AInt): AInt; stdcall;

{** ������������� ����� ����������� ���� ����� }
function SetIsShowAllFigures(Value: ABool): AError; stdcall;

{** ������ ������� �� ������� OnCompileExtData }
function SetOnCompileExtData(Value: AProc): AError; stdcall;

{** ������ ������� �� ������� OnImportDataFromXls }
function SetOnImportDataFromXls(Value: CadApp_ImportDataFromXls_Proc): AError; stdcall;

{** ������ ������� �� ������� OnImportDataOk }
function SetOnImportDataOk(Value: CadApp_ImportDataOk_Proc): AError; stdcall;

{** ������ ������� �� ������� OnDrawWinInit }
function SetOnDrawWinInit(Value: AProc): AError; stdcall;

{** ������������� ������ �� ��������� ����� }
function SetPositionBranch(BranchNum: AInt): AError; stdcall;

{** ���������� 2D c���� }
function Show2D(): ABool; stdcall;

{** ���������� 3D c���� }
function Show3D(PaintBox: AImage; X, Z: AInt): ABool; stdcall;

{** ���������� ������� �� ��������� }
function ShowHelp(): AError; stdcall;

{** ���������� �������� �������� ����������� }
function ShowLegend(): AError; stdcall;

{** ���������� �������� �������� ����������� }
function ShowLegendWin2P(var StrokaUO: APascalString): AError;

{** ���������� ���������� ���� ��� ������ ���� ����� }
function ShowPrintDialog(): AError; stdcall;

{** ���������� ���� ������ � ��������� ������ }
function ShowPrinterSetupDialog(): AError; stdcall;

{** ����� ������� "�����" }
function ShowSettingsWin(): AInt; stdcall;

implementation

uses
  {$ifdef Vcl}CadMainWin,{$endif}
  CadAppMain;

{ Public }

function CalcVisible(): AError;
begin
  Result := CadApp_CalcVisible();
end;

function CreateNewProject(): AError;
begin
  Result := CadApp_CreateNewProject();
end;

function DrawPla(): AError;
begin
  Result := CadApp_DrawPla();
end;

function Fin(): AError;
begin
  Result := CadApp_Fin();
end;

function FindBranchByNum(BranchNum: AInt): AInt;
begin
  {$IFDEF VCL}
  try
    Result := CadAppDataUtils.Data_FindBranch(BranchNum);
  except
    Result := -1;
  end;
  {$ELSE}
  Result := -1;
  {$ENDIF VCL}
end;

function FindNodeByNum(NodeNum: AInt): AInt;
begin
  {$IFDEF VCL}
  try
    Result := CadAppDataUtils.Data_FindNode(NodeNum);
  except
    Result := 0;
  end;
  {$ELSE}
  Result := 0;
  {$ENDIF VCL}
end;

function GetCurrentLayerIndex(): AInt;
begin
  {$IFDEF VCL}
  try
    Result := CadMainWin_GetCurrentLayerIndex();
  except
    Result := -1;
  end;
  {$ELSE}
  Result := -1;
  {$ENDIF VCL}
end;

function GetMaxViewPort(): TRect;
begin
  Result := CadApp_GetMaxViewPort();
end;

function ImportDan(): AError;
begin
  Result := CadApp_ImportDan();
end;

function Init(): AError;
begin
  Result := CadApp_Init();
end;

function InputPic(): ABool;
begin
  Result := (CadApp_InputPic() >= 0);
end;

function LoadFileExP(const FileName: APascalString; FileType: AInt; IsAll: ABool): ABool;
begin
  {$ifdef Vcl}
  Result := (CadApp_LoadFileExP(FileName, FileType, IsAll) >= 0);
  {$else}
  Result := False;
  {$endif}
end;

function LoadFileP(const FileName: APascalString): AError;
begin
  {$ifdef Vcl}
  Result := CadApp_LoadFileP(FileName);
  {$else}
  Result := -100;
  {$endif}
end;

function Open2(DefFilterIndex: AInt; IsAll: ABool): ABool;
begin
  {$IFDEF VCL}
  try
    Result := CadMainWin_Open2(DefFilterIndex, IsAll);
  except
    Result := False;
  end;
  {$ELSE}
  Result := False;
  {$ENDIF VCL}
end;

function Prepare(): AInt;
begin
  Result := CadApp_Prepare();
end;

function SaveFileExP(const FileName, StrokaDan, StrokaUO: APascalString; Version: AInt): AError;
begin
  Result := CadApp_SaveFileExP(FileName, StrokaDan, StrokaUO, Version);
end;

function SelectBranch(BranchNum: AInt): AInt;
begin
  Result := CadApp_SelectBranch(BranchNum);
end;

function SetIsShowAllFigures(Value: ABool): AError;
begin
  Result := CadApp_SetIsShowAllFigures(Value);
end;

function SetOnCompileExtData(Value: AProc): AError;
begin
  Result := CadApp_SetOnCompileExtData(Value);
end;

function SetOnDrawWinInit(Value: AProc): AError;
begin
  {$IFDEF VCL}
  try
    DrawWin_SetOnDrawWinInit(Value);
    Result := 0;
  except
    Result := -1;
  end;
  {$ELSE}
  Result := -1;
  {$ENDIF VCL}
end;

function SetOnImportDataFromXls(Value: CadApp_ImportDataFromXls_Proc): AError;
begin
  Result := CadApp_SetOnImportDataFromXls(Value);
end;

function SetOnImportDataOk(Value: CadApp_ImportDataOk_Proc): AError;
begin
  Result := CadApp_SetOnImportDataOk(Value);
end;

function SetPositionBranch(BranchNum: AInt): AError;
begin
  Result := CadApp_SetPositionBranch(BranchNum);
end;

function Show2D(): ABool;
begin
  {$IFDEF VCL}
  try
    Result := DrawWin_2D();
  except
    Result := False;
  end;
  {$ELSE}
  Result := False;
  {$ENDIF VCL}
end;

function Show3D(PaintBox: AImage; X, Z: AInt): ABool;
begin
  {$IFDEF VCL}
  try
    Result := DrawWin_3D(PaintBox, X, Z);
  except
    Result := False;
  end;
  {$ELSE}
  Result := False;
  {$ENDIF VCL}
end;

function ShowHelp(): AError;
begin
  Result := CadApp_ShowHelp();
end;

function ShowLegend(): AError;
begin
  Result := CadApp_ShowLegend();
end;

function ShowLegendWin2P(var StrokaUO: APascalString): AError;
begin
  Result := CadApp_ShowLegendWin2(StrokaUO);
end;

function ShowPrintDialog(): AError;
begin
  Result := CadApp_ShowPrintDialog();
end;

function ShowPrinterSetupDialog(): AError;
begin
  Result := CadApp_ShowPrinterSetupDialog();
end;

function ShowSettingsWin(): AInt;
begin
  Result := CadApp_ShowSettingsWin();
end;

end.
