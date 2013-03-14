{**
@Abstract Cad.App data
@Author Prof1983 <prof1983@ya.ru>
@Created 02.07.2009
@LastMod 14.03.2013
}
unit CadAppData;

interface

uses
  ABase, AUiBase, CadAppBase, CadCoreBase, CadDrawBase;

var
  CadDataGrid: AStringGrid;

  {** Data update event }
  FCompileExtDataEvent: AEvent;

  FIsShowAllFigures: Boolean;

  NameSh_Text: APascalString;

  NameVar_Text: APascalString;

  {** Event fires when needed clean data }
  FOnDataClear: AProc;

  FOnCompileExtData: AProc;

  {** Event fires when importing data from Xls file }
  FOnImportDataFromXls: CadApp_OnImportDataFromXls_Proc;

  FOnImportDataOk: CadApp_OnImportDataOk_Proc;

  FOnSaveFile: CadApp_OnSaveFile_Proc;

  {** Event fires when required in the table with data set pointer to the desired item
      Obj - Table num (0-Branchs, 1-Nodes)
      Data - Element (branch/node) num }
  FOnSetPosition: ACallbackProc;

  DocDirectory: APascalString;

  {** True if the window rendering is in the closing }
  DrawWin_IsClosing1: Boolean;

  MainMenu: AMenu;
  MainFileMenu: AMenuItem;
  MainTaskMenu: AMenuItem;
  MainViewMenu: AMenuItem;

  {** View the display circuitry }
  ViewMode: TCadAppViewMode;

  {** The main element of rendering graphics }
  PaintBoxCanvas: ACanvas;

  {** Interface to external data }
  TablData_IsModyfid: Boolean;

implementation

end.
