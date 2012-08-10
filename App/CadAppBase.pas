{**
@Abstract Cad.App base consts and types
@Author Prof1983 <prof1983@ya.ru>
@Created 12.07.2011
@LastMod 10.08.2012
}
unit CadAppBase;

interface

uses
  ABase;

const
  CadApp_Name = 'CadApp';
  CadApp_Uid = $11033101;

type
  CadApp_OnImportDataFromXls_Proc = function(const FileName: AString_Type; IsAll: ABoolean): AError; stdcall;
  CadApp_OnImportDataOk_Proc = function(const Data: AWideString): AError; stdcall;
  CadApp_OnSaveFile_Proc = function(const Data: PAnsiChar): AError; stdcall;

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

implementation

end.
 