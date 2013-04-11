{**
@Abstract Import data from xls file
@Author Prof1983 <prof1983@ya.ru>
@Created 08.09.2011
@LastMod 11.04.2013
}
unit CadImportXls;

interface

uses
  Grids,
  ABase,
  AUiBase,
  AUiControls,
  AUiDialogsEx1,
  AUiMain,
  AUiWaitWin,
  AUiWindows,
  AUtilsMain,
  CadDrawBase,
  CadImportXlsUtils,
  CadSceneMain;

// --- CadScene ---

function CadScene_ImportXls(Scene: AGScene; const FileName: string; TablData, TablDavl,
    TablVen: TStringGrid; IsAll: ABool; var Ver: AInt): AError;

function CadScene_ImportXls2(Scene: AGScene; const FileName: string; TablData, TablDavl,
    TablVen: TStringGrid; IsAll, ShowWaitWin: ABool; var Ver: AInt): AError;

implementation

var
  WaitWin: AWindow;
  Tmp1: Integer;
  WaitWinPosition: Integer;
  WaitWinStep: Integer;
  WaitWinStr: string;

// --- Events ---

function DoCallback(): AError; stdcall;
begin
  if (WaitWin = 0) then
  begin
    Result := 0;
    Exit;
  end;

  Inc(WaitWinPosition);

  Inc(Tmp1);
  if (Tmp1 < WaitWinStep) then
  begin
    Result := 0;
    Exit;
  end;
  Tmp1 := 0;

  AUiWaitWin_SetTextP(WaitWin, WaitWinStr + AUtils_IntToStrP(WaitWinPosition));
  AUiWaitWin_SetPosition(WaitWin, WaitWinPosition);

  Result := 0;
end;

// --- CadScene ---

function CadScene_ImportXls(Scene: AGScene; const FileName: string; TablData, TablDavl,
    TablVen: TStringGrid; IsAll: ABool; var Ver: AInt): AError;
const
  BranchsTitleRow = 4; // ����� ������ � ������������� ������� � ������������� ������� ������
  NodesTitleRow = 4; // ����� ������ � ������������� ������� � ������������� ������� �����
var
  Sheet: IExcelWorksheet;
  NodeCol: TNodeColRec;
  BranchCol: TBranchColRec;
begin
  // ��������� Excel
  if (CadImportXls_Prepare(Scene, FileName) < 0) then
  begin
    Result := -2;
    Exit;
  end;

  // --- ���� ---
  try
    Sheet := CadImportXls_GetSheet('����');
    // �������������� ����
    CadImportXls_PrepareNodes(Sheet, TablDavl, NodesTitleRow, IsAll, Ver, NodeCol);
    // ����������� ����
    CadImportXls_ReadNodes(Scene, Sheet, TablDavl, Ver, NodesTitleRow, NodeCol, IsAll, nil);
  except
    CadImportXls_Quit();
    Sheet := nil;
    Result := -3;
    Exit;
  end;

  // --- ����� ---
  try
    Sheet := CadImportXls_GetSheet('�����');
    // �������������� �����
    CadImportXls_PrepareBranchs(Sheet, BranchsTitleRow, IsAll, BranchCol);
    // ����������� �����
    CadImportXls_ReadBranchs(Scene, Sheet, TablData, TablVen, BranchsTitleRow, BranchCol, IsAll, nil);
  except
    CadImportXls_Quit();
    Sheet := nil;
    Result := -4;
    Exit;
  end;

  // ��������� Excel
  CadImportXls_Quit();
  // ���������� ������� �����
  CadImportXls_Work1(TablDavl, Ver, nil);
  CadImportXls_Work2(Scene, TablDavl, Ver, IsAll, nil);
  CadImportXls_Work3(Scene, TablDavl, Ver, IsAll, nil);

  Result := 0;
end;

function CadScene_ImportXls2(Scene: AGScene; const FileName: string; TablData, TablDavl,
    TablVen: TStringGrid; IsAll, ShowWaitWin: ABool; var Ver: AInt): AError;
const
  BranchsTitleRow = 4; // ����� ������ � ������������� ������� � ������������� ������� ������
  NodesTitleRow = 4; // ����� ������ � ������������� ������� � ������������� ������� �����
var
  Sheet: IExcelWorksheet;
  RowsCount1: Integer;
  WaitWinMaxPosition: Integer;
  Res: AError;
  NodeCol: TNodeColRec;
  BranchCol: TBranchColRec;
begin
  if not(ShowWaitWin) then
  begin
    Result := CadScene_ImportXls(Scene, FileName, TablData, TablDavl, TablVen, IsAll, Ver);
    Exit;
  end;

  WaitWin := AUiWaitWin_NewP('�������������� ������', '���������...', 100);
  AUiControl_SetVisible(WaitWin, True);
  try
    // ��������� Excel
    if (CadImportXls_Prepare(Scene, FileName) < 0) then
    begin
      Result := -2;
      Exit;
    end;

    // --- ���� ---
    try
      Sheet := CadImportXls_GetSheet('����');
      // �������������� ����
      CadImportXls_PrepareNodes(Sheet, TablDavl, NodesTitleRow, IsAll, Ver, NodeCol);
      RowsCount1 := CadImportXls_GetRowCount(Sheet);

      WaitWinStep := 100;
      WaitWinPosition := 0;
      WaitWinStr := '������ ����� '+AUtils_IntToStrP(RowsCount1)+'/';
      AUiWaitWin_SetTextP(WaitWin, WaitWinStr);
      AUiWaitWin_SetMaxPosition(WaitWin, RowsCount1);
      AUiWaitWin_SetPosition(WaitWin, 0);
      // ����������� ����
      CadImportXls_ReadNodes(Scene, Sheet, TablDavl, Ver, NodesTitleRow, NodeCol, IsAll, DoCallback);
    except
      CadImportXls_Quit();
      Sheet := nil;
      Result := -3;
      Exit;
    end;

    // --- ����� ---
    try
      Sheet := CadImportXls_GetSheet('�����');
      // �������������� �����
      CadImportXls_PrepareBranchs(Sheet, BranchsTitleRow, IsAll, BranchCol);
      RowsCount1 := CadImportXls_GetRowCount(Sheet);

      WaitWinStep := 100;
      WaitWinPosition := 0;
      WaitWinStr := '������ ������ '+AUtils_IntToStrP(RowsCount1)+'/';
      AUiWaitWin_SetTextP(WaitWin, WaitWinStr);
      AUiWaitWin_SetMaxPosition(WaitWin, RowsCount1);
      AUiWaitWin_SetPosition(WaitWin, 0);
      // ����������� �����
      CadImportXls_ReadBranchs(Scene, Sheet, TablData, TablVen, BranchsTitleRow, BranchCol, IsAll, DoCallback);
    except
      CadImportXls_Quit();
      Sheet := nil;
      Result := -4;
      Exit;
    end;

    // ��������� Excel
    CadImportXls_Quit();

    // --- ���������� ������� ����� ---

    //ASystem.ShowMessageP('��������� 1/3');

    try
      WaitWinStep := 10;
      WaitWinMaxPosition := CadDrawScene_GetColl(Scene).NodeList.GetCount();
      AUiWaitWin_SetMaxPosition(WaitWin, WaitWinMaxPosition);
      WaitWinStr := '��������� 1/3 '+AUtils_IntToStrP(WaitWinMaxPosition)+'/';
      AUiWaitWin_SetTextP(WaitWin, WaitWinStr);
      WaitWinPosition := 0;
      CadImportXls_Work2(Scene, TablDavl, Ver, IsAll, DoCallback);
    except
      Result := -6;
      Exit;
    end;

    //ASystem.ShowMessageP('��������� 2/3');

    try
      WaitWinStep := 10;
      WaitWinMaxPosition := TablDavl.RowCount;
      AUiWaitWin_SetMaxPosition(WaitWin, WaitWinMaxPosition);
      WaitWinStr := '��������� '+AUtils_IntToStrP(WaitWinMaxPosition)+'/';
      AUiWaitWin_SetTextP(WaitWin, WaitWinStr);
      WaitWinPosition := 0;
      CadImportXls_Work1(TablDavl, Ver, DoCallback);
    except
      Result := -5;
      Exit;
    end;

    //ASystem.ShowMessageP('��������� 3/3');

    try
      WaitWinStep := 10;
      WaitWinMaxPosition := TablDavl.RowCount;
      AUiWaitWin_SetMaxPosition(WaitWin, WaitWinMaxPosition);
      WaitWinStr := '��������� 3/3 '+AUtils_IntToStrP(WaitWinMaxPosition)+'/';
      AUiWaitWin_SetTextP(WaitWin, WaitWinStr);
      WaitWinPosition := 0;
      Res := CadImportXls_Work3(Scene, TablDavl, Ver, IsAll, DoCallback);
      if (Res < 0) then
      begin
        AUi_ExecuteMessageDialog1P('��������� ������ � CadImportXls_Work3. WaitWinPosition='+AUtils_IntToStrP(WaitWinPosition), '', 0);
        Result := -8;
        Exit;
      end;
    except
      Result := -7;
      Exit;
    end;

    Result := 0;
  finally
    AUiWindow_Free(WaitWin);
  end;
end;

end.
