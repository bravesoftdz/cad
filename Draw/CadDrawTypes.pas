{**
@Author Prof1983 <prof1983@ya.ru>
@Created 19.12.2009
@LastMod 27.02.2013
}
unit CadDrawTypes;

interface

uses
  ABase;

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
  {** ������ ��������� ������� }
  TPeroSost = (
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
    cSvybOb,           // PLAN
    cSVvodOb,          // PLAN
    cSRectangleVP_Del,
    cSLine,
    cSElipse,
    cSVStolb,          // PLAN
    cSPodRabL,         // PLAN
    cSPodRabPl,        // PLAN
    cSPodRab           // PLAN
    );

type
  {** ��� ����� }
  TCadLineType = (
    cLineTypeDef = 0,     // �� ���������
    cLineType1 = 1,       // ���������
    cLineType2 = 2,       // �������
    cLineType2b = 3,      // ������� � ��������
    cLineType3 = 4        // ���������� (���������)
    );                        

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
  cIFact_Degas = 12;  // Degassing,Planning
  cIFact_VentCad = 8;
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
  cITipV = 44;   // (VentCad)
  cIPl = 45;     // (VentCad)
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

type
  {** ��� ������ }
  TGFigureType = type AInt;
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
  cPodRabL = 1015; // PLAN
  cPodRabPl = 1016; // PLAN
  cVstolb = 1017;
  cBrF = 2001;
  cNdF = 2002;
  cBrNF = 2003;
  cExtF = 2004;
  cTextF = 2005;
  cUOSize = 3001;

implementation

end.
