{**
@Abstract Cad.Core main functions
@Author Prof1983 <prof1983@ya.ru>
@Created 10.08.2012
@LastMod 14.03.2013
}
unit CadCoreMain;

interface

uses
  ABase,
  AStringUtils,
  AUtilsMain;

// --- CadCore ---

{** ���������� ����� ������������������� ���� ����� �� ����������
    @return
      ���� ���������� �������, �� ���������� ��� ����� (������+1);
      ���� ���������� �� �������, �� ���������� ����. }
function CadCore_CheckExt(const Ext: APascalString): AInteger; {$ifdef AStdCall}stdcall;{$endif}

function CadCore_CheckFileExt(const FileName: APascalString): AInt; deprecated {$ifdef ADeprText}'Use CadCore_CheckFileExtP()'{$endif};

function CadCore_CheckFileExtP(const FileName: APascalString): AInt;

function CadCore_Fin(): AError; {$ifdef AStdCall}stdcall;{$endif}

function CadCore_GetDrawFlag(): AInt; {$ifdef AStdCall}stdcall;{$endif}

function CadCore_GetProjectFileName(): APascalString; {$ifdef AStdCall}stdcall;{$endif}

function CadCore_GetProjectFilePath(): APascalString; {$ifdef AStdCall}stdcall;{$endif}

function CadCore_Init(): AError; {$ifdef AStdCall}stdcall;{$endif}

function CadCore_RegisterExt(const Ext: APascalString): AInteger; {$ifdef AStdCall}stdcall;{$endif}

implementation

uses
  CadData;

var
  FRegisteredExt: array of APascalString;
  FInitialized: Boolean;

// --- CadCore ---

function CadCore_CheckExt(const Ext: APascalString): AInteger;
var
  I: Integer;
begin
  for I := 0 to High(FRegisteredExt) do
  begin
    if (FRegisteredExt[I] = Ext) then
    begin
      Result := I + 1;
      Exit;
    end;
  end;
  Result := 0;
end;

function CadCore_CheckFileExt(const FileName: APascalString): AInteger;
begin
  Result := CadCore_CheckFileExtP(FileName);
end;

function CadCore_CheckFileExtP(const FileName: APascalString): AInt;
var
  Ext: string;
begin
  Ext := AString_ToUpperP(AUtils_TrimP(AUtils_ExtractFileExtP(FileName)));
  // �������� ����� ������������������� ���� ����� �� ����������.
  Result := CadCore_CheckExt(Ext);
end;

function CadCore_Fin(): AError;
begin
  SetLength(FRegisteredExt, 0);
  FInitialized := False;
  Result := 0;
end;

function CadCore_GetDrawFlag(): AInt;
begin
  Result := DrawFlag;
end;

function CadCore_GetProjectFileName(): APascalString;
begin
  Result := DrawFileName;
end;

function CadCore_GetProjectFilePath(): APascalString;
begin
  Result := AUtils_ExtractFilePathP(DrawFileName);
end;

function CadCore_Init(): AError;
begin
  if FInitialized then
  begin
    Result := 0;
    Exit;
  end;
  Finitialized := True;
  Result := 0;
end;

function CadCore_RegisterExt(const Ext: APascalString): AInteger;
var
  I: Integer;
begin
  I := Length(FRegisteredExt);
  SetLength(FRegisteredExt, I + 1);
  FRegisteredExt[I] := Ext;
  Result := I + 1;
end;

end.
 