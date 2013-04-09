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
  CadApp_OnAppMessage_Proc = function(var Msg: AUInt; var WParam, LParam: AInt;
      var Handled: ABool): AError; stdcall;
  CadApp_OnCloseQuery_Proc = function(var CanClose: ABool): AError; stdcall;
  CadApp_OnImportDataFromXls_Proc = function(const FileName: AString_Type; IsAll: ABoolean): AError; stdcall;
  CadApp_OnImportDataOk_Proc = function(const Data: AWideString): AError; stdcall;

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
 