{**
@Abstract Cad.Draw base consts and types
@Author Prof1983 <prof1983@ya.ru>
@Created 07.04.2011
@LastMod 09.04.2013
}
unit CadDrawBase;

interface

uses
  ABase, ABaseTypes;

type
  ACanvas = type AInteger;

type
  AImage = type AInteger; // TImage

type
  AGFigure = type AInt; // TGCustomFigure

type AGFigureCollection = type AInt; // TGCollFigure

type AGScene = type AInt; // TGScene

type
  TSchemeIndex = type Integer;
const
  nsRasch = 0;
  nsVent = 1;
  nsPla = 2;
  nsPPog = 3;
  nsN4 = 4;

type
  TStampDrawProc = procedure(Canvas: AInteger{TCanvas}; P0X, P0Y, P1X, P1Y: AInteger;
      Scale1, Scale2: AFloat32; IsPrint: ABoolean); stdcall;

implementation

end.
 