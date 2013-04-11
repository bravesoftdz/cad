{**
@Abstract Cad.App base consts and types
@Author Prof1983 <prof1983@ya.ru>
@Created 12.07.2011
@LastMod 09.04.2013
}
unit CadAppBase;

interface

uses
  ABase;

const
  CadApp_Name = 'CadApp';
  CadApp_Uid = $11033101;

type
  CadApp_AppMessage_Proc = function(var Msg: AUInt; var WParam, LParam: AInt;
      var Handled: ABool): AError; stdcall;
  CadApp_CloseQuery_Proc = function(var CanClose: ABool): AError; stdcall;
  CadApp_ImportDataFromXls_Proc = function(const FileName: AString_Type; IsAll: ABoolean): AError; stdcall;
  CadApp_ImportDataOk_Proc = function(const Data: AWideString): AError; stdcall;
  CadApp_LoadFile_Proc = function(FileName: AString): AError; stdcall;
  CadApp_LoadFileEx_Proc = function(FileName: AString; FileType: AInt; IsAll: ABool): AError; stdcall;

type
  {** ��������� ������� ��� ������ }
  TColSetting = record
    Enabled: Boolean;    //**< ��������
    Width: Real;         //**< ������ �������
  end;
  TColSettings = array of TColSetting;

type
  {** ��� ����������� �����:
      0-���������� �������������,
      1-����������� �����,
      2-��������������� ������,
      3-����� � ������������� ��������,
      4-����� � �������� R }
  TCadAppViewMode = (
    CadAppViewMode_Normal,
    CadAppViewMode_OpVetvi,
    CadAppViewMode_FireVetvi,
    CadAppViewMode_OtrVetvi,
    CadAppViewMode_RRegVetvi
    );

const
  DataPage0 = 0; // Common
  DataPage1 = 1; // Branchs
  DataPage2 = 2; // Ventilators
  DataPage4 = 4;
  DataPage6 = 6;
  DataPage7 = 7;

implementation

end.
 