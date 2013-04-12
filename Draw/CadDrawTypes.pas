{**
@Author Prof1983 <prof1983@ya.ru>
@Created 19.12.2009
@LastMod 11.04.2013
}
unit CadDrawTypes;

interface

uses
  Graphics,
  Types,
  ABase,
  CadConsts;

// --- Simple types ---

type
  // �������� �� ��������� = 'z'
  // 'r' - ����� � ������
  TGBrCost = Char;              // r,z,o,s,p

// --- Simple struct ---

type
  TPointCoord = record
    X: Real;
    Y: Real;
    Z: Real;
    Z0: Real;
  end;

type
  TPointReal = record
    X: Real;
    Y: Real;
  end;

// --- Struct ---

type
  { ������ ��� ����������� ������� ������,
    ������ ����� ���� �� ���������
    �������� � �������������� �� ������� �������. �� �������� �����
    ��������� ������ ��������� � ��������� ������ + ��������� ������ }
  TGExtData = record
    Data1: Integer;    // ���� ������
    Coord: TPoint;     // ���������� ������
    CoordS_: TPoint;   // ���������� ������ ��������
    CoordZ: TSize;     // ������� ������ ������ � ��������
    Enable: Boolean;   // � ������ �� ��������?
    Color: TColor;     // ���� ������� ��� ����������� ����� ���
    TypePla: Byte;     // ��� ������ ��� ���
    Angle: Real;       // ���� ������ ��� ������� ������
    MoveFlag: Boolean; // ������� �� �������?
  end;

type
  {** ����� ������ ��� ������� ���  }
  TCadPlaRec = record
    FlagPLA: ABool;             // ������� �� �������� ���
    Coord: TPoint;              // ���������� ������
    Color: TColor;              // ���� ������� ��� ����������� ����� ���
  end;
  TGPlaRecord = TCadPlaRec;

type
  {** �������� ����� }
  TCadBranch = record
    BrNum: Integer;            // ����� �����
    BrBNode: Integer;          // ����� ���������� ����
    BrENode: Integer;          // ����� ��������� ����
    BrBNodeI: Integer;         // ������ ���������� ����
    BrENodeI: Integer;         // ������ ��������� ����
    BrName: string;            // �������� �����

    BrCName: TPoint;           // ���������� �������� �����
    BrCoord: TPoint;           // ���������� ������ �����
    BrCNameZ: TSize;
    BrCoordZ: TSize;
    BrNEnable: Boolean;        // ��������� �� �������� ������������ �����
    BrCEnable: Boolean;        // ��������� �� �������� �������� �����
    ExtCount: Integer;         // ����� ������� ������
    //ANyAngle: Integer;       // 0-����,2-���������,1-�����������;

    ArrowData: TGExtData;      // ������� ������ - ������� (������ < 5) / ������ "�������"
    // �������
    ExtData2: TGExtData;       // ������� ������ - ����������� �������?
    ExtData3: TGExtData;       // ������� ������ - ���
    ExtDataQ_Value: Real;      // ExtDataQ.Data2; 
    ExtData3_NomPla: Integer;  // ����� ���.
    ExtData4: TGExtData;       // ������� ������ - �������� � �����
    ExtData6: TGExtData;       // ������� ������ - ������ / ���� ������������ ������� ������
    ExtData7: TGExtData;       // ������� ������
    ExtData8_: TGExtData;      // ������� ������
    ExtDataQ: TGExtData;       // ������� ������ - ����������� �������(Data1) � ��������� ������� (Data2)

    // ����� ���������� ������� ��� ������ ������
    PlaData: array[1..MaxPlaCount+1] of TCadPlaRec; // ������ ��� ���
    ArrowDefault: Boolean;     // �������: ���������� �� ��������� - 1 ��� �������� - 0
    BrBranch: Boolean;         // ��� ����� ���������� ����� ������ �����������: ����������� �����, ������
    BrMoveCName: Boolean;      // ������� ��� ��� �������� �����
    BrMoveCoord: Boolean;      // ������� ��� ��� ����� �����
    BrSost: TGBrCost;          // ��������� ���������.
    BrDataBegin: Integer;
    BRDataEnd: Integer;
    BrGotovo: Real;
    BrPl: Integer;             // �����
    BrTipV: Integer;           // ��� ���������
  end;
  TGCustomBranch = TCadBranch;

type
  {** ��� ������ }
  TCadFigureType = (
    ftUncnown = 0,
    ftLine = 1,            // �����-�����
    ftPic = 2,             //cTPic = 0,
    ftUo = 3,              //cTUO1 = 0,
    ft4 = 4,
    ftRectangle = 5,       // �������������
    ftPolygon = 6,         // �������
    ftArc = 7,             // ����
    ftElipse = 8           // ����
    );

type
  {** ��� ������ }
  TCadFigureTypeInt = type AInt;
  TGFigureType = TCadFigureTypeInt;
const
  cNone = 0;
  cLine_Branch = 1001;
  cPolyline = 1002;
  cArc = 1003;
  cText = 1004;
  cPicture = 1005;
  cUO = 1006;
  cNode = 1007;                 // ����
  cRectangle = 1008;
  cALine = 1011;
  cElipse = 1009;
  cPie = 1012;
  cPolygon = 1010;
  cPodRabL = 1015;
  cPodRabPl = 1016; 
  cVstolb = 1017;
  cBrF = 2001;
  cNdF = 2002;
  cBrNF = 2003;
  cExtF = 2004;
  cTextF = 2005;
  cUOSize = 3001;

type
  // ��������� ��� ��������
  TCadImage = record
    Name: APascalString;        // ��� �����
    Image: Graphics.TBitMap;    // ��������� �����������
  end;
  TGCustomImage = TCadImage;

type
  TCadLayerRec = record
    Nom: AInt;
    Name: APascalString;
    LineType: AInt;             // ��� �����
    LajerLineColor: AColor;
    Width: AInt;                // ������ �����
    LajerPenWidth: AInt;
  end;
  TGLayerRec = TCadLayerRec;

type
  {** ��� ����� }
  TCadLineType = (
    cLineTypeDef = 0,     // �� ���������
    cLineType1 = 1,       // ���������
    cLineType2 = 2,       // �������
    cLineType2b = 3,      // ������� � ��������
    cLineType3 = 4        // ���������� (���������)
    );                        

type // ��������� ����������� �����
  TCadNode = record
    NdNum: Integer;                 // ����� ����
    NdPnt_X: AInt;                  // ���������� ����
    NdPnt_Y: AInt;                  // ���������� ����
    NdPnt_Z: AInt;                  // ���������� Z
    NdPnt2D_X: AInt;                // ���������� ����
    NdPnt2D_Y: AInt;                // ���������� ����
    NdPntS: TPoint;                 // ���������� ���� ��� ��������� 2D (� ��������)
    NdPnt3D: TPointCoord;           // ���������� ���� ��� ��������� 3D
    NdCoord: TPoint;                // ���������� ������ ������ ���� � �������� �������
    NdCoordS: TPoint;               // ���������� ������ ������ ���� � ��������
    NdNSize: TSize;                 // ������ (������) ������ � ��������
    NdVis: Boolean;                 // ������� ��������� ����
    NdEntry: Integer;               // ����� ������ ������� ����������� ����
    NdEnable: Boolean;              // ��������� �������� ���� ��� ���
    FGBRect: TRect;                 // �������������� �������������
    NdType: Integer;                // ��� ����
    NdVin: Boolean;                 // �������
    Davl: string;                   // ��������
    NVx: Integer;                   // �������� ����� (���-��) ?
    NIsx: Integer;                  // ��������� ����� (���-��) ?
    Vx: array[0..100] of Integer;   // �������� �����
    Isx: array[0..100] of Integer;  // ��������� �����
    IncBR: array[0..100] of Integer;// ������ �������� ���� �������������� ������
    NdSoprag: Boolean;              // ������������ ���������� ��� ���
    NPnt1: TPoint;                  // ���������� ��� ���������� ������� ����� ��� ��������� ����������
    NPnt2: TPoint;                  // ���������� ��� ���������� ������� ����� ��� ��������� ����������
  end;
  TGCustomNode = TCadNode;

type
  {** ������ ��������� ������� }
  TCadPenStyle = (
    cSNone,            // ����� � ��������
    cSSelect,
    cSLine_Branch,
    cSPolyline,
    cSArc,
    cSText,
    cSPicture,
    cSMove,            // �����������
    cSMovePaint,       // ����������� ����� �����
    cSMovePaintW,      // ����������� ����� �����
    cSPolygon,
    cSPlus,
    cSMinus,
    cSPlusRect,        // ���������������
    cSGetPoint,
    cSRectangle,       // �������������
    cSPrintRect,       // ������
    cSEditWay,
    cSMoveGroup,
    cSMoveGroupGo,
    cSForwardPlan,
    cSPropGroup,
    cSvybOb,
    cSVvodOb,
    cSRectangleVP_Del,
    cSLine,
    cSElipse,
    cSVStolb,
    cSPodRabL,
    cSPodRabPl,
    cSPodRab
    );
  TPeroSost = TCadPenStyle;

type
  {** ��� }
  TCadPla = record
    Point: TPoint;              //**< ����� ������ ��������� ���
    Typ: Byte;                  //**< ��� ��������� ���
    Data: Integer;              //**< ������ ��������� ���
    Color: TColor;              //**< ���� ����� ��������� ���
  end;
  TGPla = TCadPla;

type
  TCadPlastRec = record
    Name: APascalString;
    Color: AInt;
    m: AFloat;
    Checked: ABool;
  end;
  TGPlastRec = TCadPlastRec;

type
  {** ���������� ��� ��� ��������� ������� - ���������� }
  TCadPoly = record
    IsLong: ABool;
    Count: AInt;
    // ���������� �����������
    ppt: array [1..11] of TPoint;
  end;
  TGCustomPoly = TCadPoly;

type
  TCadProp = record
    FGType: TCadLineType;      // ��� �����
    FGPen: TPenData;           // �������� ����
    FGBrush: TBrushData;       // �������� �������
    Width: Integer;            // ������ ��������� - ������������
    WidthDefault: Boolean;     // ������: �� ��������� -  true - da
    PenBrushDefault: Boolean;  // ����: ���� �� ��������� -
  end;
  TGProp = TCadProp;

type
  {** ���� �������� }
  TCadPropType = type AInt;
const
  cINone = 0;
  cIType = 1;
  cIName = 2;                   // ������������ �����. ������������� � cIBranchName.
  cIBr = 3;
  cINd1 = 4;
  cINd2 = 5;
  cIWidth = 6;
  cIColor = 7;
  cICoord = 8;
  cIPla = 9;
  cINZS = 11;
  cIFact = 8;
  cIText = 13;
  cIFont = 14;
  cIPic = 15;
  cIPicName = 16;
  cIUOName = 17;
  cIUOAngl = 18;
  cINameUO = 19;
  cINdType = 20; //cIuoBr=20;
  cINdVin = 22;
  cIArrow = 23;  // �������
  cIPicNum = 24;
  cIPicAngle = 25;
  cIPicSize = 27;
  cIPicType = 28;
  cIUONum = 29;
  cIUOSize = 30;
  cIUOType = 31;
  cIPrType = 32;
  cIImage = 33; // ��� ����
  cIVisible = 34;
  cILajer = 35;
  cINomBr = 36;
  cINdNum = 37;
  cINdVid = 38;
  cINdDavl = 39;
  CINDx = 40;
  cINdY = 41;
  cINdZ = 42;
  cINdZ0 = 43;
  cITipV = 44;
  cIPl = 45;
  cIOstZap = 46;
  cIDataBegin = 47;
  cIDataEnd = 48;
  cITypOb = 49;
  cINameVS = 50;                // ������������ ������
  cINomVS = 51;

type
  {** ��� ������������ ������ }
  TMoveCode = (
    cMNone,
    cMBranch, // �� ������������
    cMNode,
    cMText,
    cMBrName,
    cMBrNum,
    cMPicture,
    cMNdNum,
    cMUO,
    cMPolyNode,
    cMExtData,
    cMRectangle,
    cMPolygon,
    cMPrRect,
    cMStolb,
    cMLine,
    cMElipse,
    cMArc);

type
  RTipVyr = record
    Name: string;
    TipL: AInt;
    Balans: AInt;
    Color: AInt;
    Checked: ABool;
  end;

type
  {** ����������� ���������� }
  TCadScroll = (
    csLeft,
    csRight,
    csUp,
    csDown
    );

// --- File format ---

type
  // ���������
  GFHeader = record
    Signature: array[0..3] of char;//4b
    Version: Integer;              //4b
    NameDraft: string[80];         //80 ��� 84?
    Count: Integer;                //4b
    Metrix: Integer;               //4b
    Reserv: array[0..100] of byte; //100b
  end;

type
  // ���� ������
  GFHeaderobject = record
    GFType: Integer;     // ���� ������
    GFOffset: Integer;   // �������� �� ���������� �������
  end;

type
  // ��������� ������ ��� ���������� � ����
  TGFontLocal = record
    CharSet: TFontCharset;
    Color: TColor;
    Name: TFontDataName;
    Pitch: TFontPitch;
    Size: Integer;
    Style: TFontStyles;
  end;
  // ��� ��� ������ � Stream
  TGFontRec = TGFontLocal;
  //GFont = TGFontLocal;

implementation

end.
