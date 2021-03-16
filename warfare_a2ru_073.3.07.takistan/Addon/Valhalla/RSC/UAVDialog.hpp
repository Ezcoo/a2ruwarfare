class RscUAVDialogRUS
{
	movingEnable = 0;
	idd=-1;
	onLoad = "[_this,0] spawn Func_UAV_HandleDialog";
	onKeyDown="_this call Func_UAV_KeyPress";
	onKeyUp="UAV_KeyPressed=false";
	class controlsBackground 
	{
		class Mainback : RscPicture {
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
			moving = 0;
			text = "Addon\Valhalla\pic\uavback.paa";
		};
	};
	class controls 
	{
		class MouseHandler: RscControlsGroup
		{
			idc=-1;
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
			onMouseMoving="WF_Logic setVariable ['uav_cam_move',[_this select 1,_this select 2]]";
			onMouseZChanged="WF_Logic setVariable ['uav_cam_fov',_this select 1]";
		};
		class UAVFlightParams: RscStructuredText 
		{
			idc = 5000;
			x = safeZoneX+0.05;
			y = safeZoneY+safeZoneH-0.2;
			h = 0.12;
			w = 0.26;
		};
		class UAVFlightParamsFrame: RscText
		{
			idc = -1;
			type=0;
			style=64;			
			x = safeZoneX+0.05;
			y = safeZoneY+safeZoneH-0.2;
			h = 0.12;
			w = 0.26;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {1, 1, 1, 1};
		};
		class UAVCamParams: RscStructuredText 
		{
			idc = 5001;
			x = safeZoneX+safeZoneW-0.31;
			y = safeZoneY+safeZoneH-0.2;
			h = 0.12;
			w = 0.26;
		};
		class UAVCamParamsFrame: RscText
		{
			idc = -1;
			type=0;
			style=64;			
			x = safeZoneX+safeZoneW-0.31;
			y = safeZoneY+safeZoneH-0.2;
			h = 0.12;
			w = 0.26;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {1, 1, 1, 1};
		};
		class PlayerNameDisp:RscStructuredText
		{
			x = 0.5;
			y = 0.5;
			w = 0.25;
			h = 0.2;
			sizeEx=0.028;
			size=0.028;
			lineSpacing=1;
			colorText[]={1,1,1,0.5};
			colorBackground[]={0,0,0,0};
			class Attributes
			{
				font=Zeppelin32;
				color="#ffffff";
				align="left";
				shadow=false;
			};
		};			
		class Player01:PlayerNameDisp {idc=6020;};
		class Player02:PlayerNameDisp {idc=6021;};
		class Player03:PlayerNameDisp {idc=6022;};
		class Player04:PlayerNameDisp {idc=6023;};
		class Player05:PlayerNameDisp {idc=6024;};
		class Player06:PlayerNameDisp {idc=6025;};
		class Player07:PlayerNameDisp {idc=6026;};
		class Player08:PlayerNameDisp {idc=6027;};
		class Player09:PlayerNameDisp {idc=6028;};
		class Player10:PlayerNameDisp {idc=6029;};
		class Player11:PlayerNameDisp {idc=6030;};
		class Player12:PlayerNameDisp {idc=6031;};
		class Player13:PlayerNameDisp {idc=6032;};
		class Player14:PlayerNameDisp {idc=6033;};
		class Player15:PlayerNameDisp {idc=6034;};
		class Player16:PlayerNameDisp {idc=6035;};
		class Player17:PlayerNameDisp {idc=6036;};
		class Player18:PlayerNameDisp {idc=6037;};
		class Player19:PlayerNameDisp {idc=6038;};
		class Player20:PlayerNameDisp {idc=6039;};
		class Player21:PlayerNameDisp {idc=6040;};
		class Player22:PlayerNameDisp {idc=6041;};
		class Player23:PlayerNameDisp {idc=6042;};
		class Player24:PlayerNameDisp {idc=6043;};
		class Player25:PlayerNameDisp {idc=6044;};
		class Player26:PlayerNameDisp {idc=6045;};
		class Player27:PlayerNameDisp {idc=6046;};
		class Player28:PlayerNameDisp {idc=6047;};
		class Player29:PlayerNameDisp {idc=6048;};
		class Player30:PlayerNameDisp {idc=6049;};
		class Player31:PlayerNameDisp {idc=6050;};
		class Player32:PlayerNameDisp {idc=6051;};
		class Player33:PlayerNameDisp {idc=6052;};
		class Player34:PlayerNameDisp {idc=6053;};
		class Player35:PlayerNameDisp {idc=6054;};
		class Player36:PlayerNameDisp {idc=6055;};
		class Player37:PlayerNameDisp {idc=6056;};
		class Player38:PlayerNameDisp {idc=6057;};
		class Player39:PlayerNameDisp {idc=6058;};
		class Player40:PlayerNameDisp {idc=6059;};
		class Player41:PlayerNameDisp {idc=6060;};
		class Player42:PlayerNameDisp {idc=6061;};
		class Player43:PlayerNameDisp {idc=6062;};
		class Player44:PlayerNameDisp {idc=6063;};
		class Player45:PlayerNameDisp {idc=6064;};
		class Player46:PlayerNameDisp {idc=6065;};
		class Player47:PlayerNameDisp {idc=6066;};
		class Player48:PlayerNameDisp {idc=6067;};
		class Player49:PlayerNameDisp {idc=6068;};
		class Player50:PlayerNameDisp {idc=6069;};
		class Player51:PlayerNameDisp {idc=6070;};
		class Player52:PlayerNameDisp {idc=6071;};
		class Player53:PlayerNameDisp {idc=6072;};
		class Player54:PlayerNameDisp {idc=6073;};
		class Player55:PlayerNameDisp {idc=6074;};
		class Player56:PlayerNameDisp {idc=6075;};
		class Player57:PlayerNameDisp {idc=6076;};
		class Player58:PlayerNameDisp {idc=6077;};
		class Player59:PlayerNameDisp {idc=6078;};
		class Player60:PlayerNameDisp {idc=6079;};
		
		class DirN: RscText
		{
			idc = 7000;
			type=0;
			style="0x00";			
			x = 0;
			y = 0;
			h = 0.05;
			w = 0.05;
			SizeEx = "0.020";
			text="N";
			colorText[] = {0.75, 0.75, 0.75, 0.8};
			colorBackground[] = {0, 0, 0, 0};
		};
		class DirS: DirN
		{
			idc=7001;
			text="S";
		};
		class DirE: DirN
		{
			idc=7002;
			text="E";
		};
		class DirW: DirN
		{
			idc=7003;
			text="W";
		};
		class DirU: DirN
		{
			idc=7004;
			style=64;
			text="";
			h = 0.02;
			w = 0.014976;
		};
	};	
};

class RscUAVDialogUS
{
	movingEnable = 0;
	idd = -1;
	onLoad = "[_this,1] spawn Func_UAV_HandleDialog";
	onKeyDown="_this call Func_UAV_KeyPress";
	onKeyUp="UAV_KeyPressed=false";
	class controlsBackground 
	{
	};
	class controls 
	{					
		class GV1: RscText
		{
			type = 0;			
			x = "safezoneX + safezoneW * 0.1";
			y = "safezoneY";
			w = "0.001 * safezoneH";
			h = "safezoneH";
			linespacing = 1;
			text = "";
			style = "0x00 + 0x10 + 0x200";			
			colorBackground[] = {0, 0, 0, 0.300000};
		};
		class GV3: GV1 
		{
			x = "safezoneX + safezoneW * 0.3";
		};
		class GV5: GV1 
		{
			x = "safezoneX + safezoneW * 0.5";
		};
		class GV7: GV1 
		{
			x = "safezoneX + safezoneW * 0.7";
		};
		class GV9: GV1 
		{
			x = "safezoneX + safezoneW * 0.9";
		};
		class GH1: GV1 
		{
			x = "safezoneX";
			y = "safezoneY + safezoneH * 0.1";
			w = "safezoneW";
			h = "0.001 * safezoneH";
		};
		class GH3: GH1 
		{
			y = "safezoneY + safezoneH * 0.3";
		};
		class GH5: GH1 
		{
			y = "safezoneY + safezoneH * 0.5";
		};
		class GH7: GH1 
		{
			y = "safezoneY + safezoneH * 0.7";
		};

		class GH9: GH1 
		{
			y = "safezoneY + safezoneH * 0.9";
		};
		/*uav crosshair*/
		class UAV_Cross_0_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + safeZoneW/2-0.11";
			y = "safezoneY + safeZoneH/2-0.11";
			w = "0.06";
			h = "0.034*0.1";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Cross_0_2: UAV_Cross_0_1
		{
			w = "0.034*0.1";
			h = "0.06";
		};		
		class UAV_Cross_1_1: UAV_Cross_0_1
		{
			y = "safezoneY + safeZoneH/2+0.11";			
		};
		class UAV_Cross_1_2: UAV_Cross_0_2
		{
			y = "safezoneY + safeZoneH/2+0.11-0.06";
		};
		class UAV_Cross_2_1: UAV_Cross_0_1
		{
			x = "safezoneX + safeZoneW/2+0.11-0.06";			
		};
		class UAV_Cross_2_2: UAV_Cross_0_2
		{
			x = "safezoneX + safeZoneW/2+0.11";
		};
		class UAV_Cross_3_1: UAV_Cross_0_1
		{
			w = "0.06+0.003";
			y = "safezoneY + safeZoneH/2+0.11";
			x = "safezoneX + safeZoneW/2+0.11-0.06";			
		};
		class UAV_Cross_3_2: UAV_Cross_0_2
		{			
			y = "safezoneY + safeZoneH/2+0.11-0.06";
			x = "safezoneX + safeZoneW/2+0.11";
		};
		
		/*uav status text*/
		class UAV_Info_Left_0: RscText 
		{
			idc = 5000;
			x = "safezoneX + (0.015)";
			y = "(0.55-0.102) + 0.001";
			w = "0.15 * 0.034*1*30 + 0.003 * 3/4";
			h = 0.500000;			
			text = "327 / lim";
			type = 0;
			style = "0x00 + 0x10 + 0x200";
			linespacing = 1;
			font = "EtelkaMonospaceProBold";
			SizeEx = "0.034*1";
			colorText[] = {0.400000, 0.674500, 0.278400, 1.000000};
			colorbackground[] = {0, 0, 0, 0};
			shadow = 2;
		};
		class UAV_Info_Left_0a: UAV_Info_Left_0 
		{
			idc = -1;
			text = "Air speed";			
			y = "(0.55-0.102)+ 0.001 - 0.034";
		};
		class UAV_Info_Right_0: UAV_Info_Left_0 
		{
			idc = 5001;			
			text = "317";				
			y = "(0.55-0.102)+ 0.001";
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25";
		};
		class UAV_Info_Right_0a: UAV_Info_Right_0 
		{
			text = "Cam dir ";			
			idc = -1;
			y = "(0.55-0.102)+ 0.001 - 0.034";
		};
		class UAV_Info_Left_1: UAV_Info_Left_0 
		{
			text = "456 / 500";
			idc = 5002;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*3";
		};
		class UAV_Info_Left_1a: UAV_Info_Left_0 
		{
			text = "Altitude";
			idc = -1;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*2";
		};
		class UAV_Info_Right_1: UAV_Info_Right_0 
		{
			idc = 5003;
			text = "-45";				
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*3";
		};
		class UAV_Info_Right_1a: UAV_Info_Right_0 
		{
			text = "Cam dive";
			idc = -1;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*2";
		};
		class UAV_Info_Left_2: UAV_Info_Left_0 
		{
			text = "312 / 200";
			idc = 5004;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*5";
		};
		class UAV_Info_Left_2a: UAV_Info_Left_0 
		{
			text = "Direction";
			idc = -1;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*4";
		};
		class UAV_Info_Right_2: UAV_Info_Right_0 
		{
			idc = 5005;
			text = "3x";				
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*5";
		};
		class UAV_Info_Right_2a: UAV_Info_Right_0 
		{
			text = "Cam zoom";
			idc = -1;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*4";
		};
		class UAV_Info_Left_3: UAV_Info_Left_0 
		{
			text = "01230456";
			idc = 5006;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*7";
		};
		class UAV_Info_Left_3a: UAV_Info_Left_0 
		{
			style = "0x00 + 0x10 + 0x200";
			text = "Map grid";
			idc = -1;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*6";
		};
		class UAV_Info_Right_3: UAV_Info_Right_0 
		{
			idc = 5007;
			text = "Normal";				
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*7";
		};
		class UAV_Info_Right_3a: UAV_Info_Right_0 
		{
			text = "Laser";
			idc = -1;
			y = "(0.55-0.102)+ 0.001 - 0.034 + 0.034*6";
		};		
		/*text frames*/
		class UAV_Frame_0_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + (0.015)";
			y = "(0.55-0.102)";
			w = "0.15 * 0.034*1*27 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_0_2: UAV_Frame_0_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_0_3: UAV_Frame_0_1 
		{			
			y = "(0.55-0.102) + 0.034*1 - 0.003";
		};
		class UAV_Frame_0_4: UAV_Frame_0_1 
		{		
			x = "safezoneX + (0.015) + 0.15 * 0.034*1*27";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};		
		class UAV_Frame_1_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25";
			y = "(0.55-0.102)";
			w = "0.15 * 0.034*1*25 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_1_2: UAV_Frame_1_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_1_3: UAV_Frame_1_1 
		{
			y = "(0.55-0.102) + 0.034*1 - 0.003";
		};
		class UAV_Frame_1_4: UAV_Frame_1_1 
		{
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25 + 0.15 * 0.034*1*25";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_2_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + (0.015)";
			y = "(0.55-0.102) + 0.034*1 * 2";
			w = "0.15 * 0.034*1*27 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_2_2: UAV_Frame_2_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_2_3: UAV_Frame_2_1 
		{			
			y = "(0.55-0.102) + 0.034*1 + 0.034*1 * 2 - 0.003";
		};
		class UAV_Frame_2_4: UAV_Frame_2_1 
		{		
			x = "safezoneX + (0.015) + 0.15 * 0.034*1*27";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_3_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25";
			y = "(0.55-0.102) + 0.034*1 * 2";
			w = "0.15 * 0.034*1*25 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_3_2: UAV_Frame_3_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_3_3: UAV_Frame_3_1 
		{
			y = "(0.55-0.102) + 0.034*1 * 2 + 0.034*1 - 0.003";
		};
		class UAV_Frame_3_4: UAV_Frame_3_1 
		{
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25 + 0.15 * 0.034*1*25";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_4_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + (0.015)";
			y = "(0.55-0.102) + 0.034*1 * 4";
			w = "0.15 * 0.034*1*27 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_4_2: UAV_Frame_4_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_4_3: UAV_Frame_4_1 
		{			
			y = "(0.55-0.102) + 0.034*1 + 0.034*1 * 4 - 0.003";
		};
		class UAV_Frame_4_4: UAV_Frame_4_1 
		{		
			x = "safezoneX + (0.015) + 0.15 * 0.034*1*27";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_5_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25";
			y = "(0.55-0.102) + 0.034*1 * 4";
			w = "0.15 * 0.034*1*25 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_5_2: UAV_Frame_5_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_5_3: UAV_Frame_5_1 
		{
			y = "(0.55-0.102) + 0.034*1 * 4 + 0.034*1 - 0.003";
		};
		class UAV_Frame_5_4: UAV_Frame_5_1 
		{
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25 + 0.15 * 0.034*1*25";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_6_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + (0.015)";
			y = "(0.55-0.102) + 0.034*1 * 6";
			w = "0.15 * 0.034*1*27 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_6_2: UAV_Frame_6_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_6_3: UAV_Frame_6_1 
		{			
			y = "(0.55-0.102) + 0.034*1 + 0.034*1 * 6 - 0.003";
		};
		class UAV_Frame_6_4: UAV_Frame_6_1 
		{		
			x = "safezoneX + (0.015) + 0.15 * 0.034*1*27";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_7_1: RscText 
		{
			type = 0;
			idc = -1;
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25";
			y = "(0.55-0.102) + 0.034*1 * 6";
			w = "0.15 * 0.034*1*25 + 0.003 * 3/4";
			h = "0.003 * safezoneH";
			linespacing = 1;
			text = "";
			colorBackground[] = {0.400000, 0.674500, 0.278400, 1.000000};
			style = "0x00 + 0x10 + 0x200";
		};
		class UAV_Frame_7_2: UAV_Frame_7_1 
		{
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};
		class UAV_Frame_7_3: UAV_Frame_7_1 
		{
			y = "(0.55-0.102) + 0.034*1 * 6 + 0.034*1 - 0.003";
		};
		class UAV_Frame_7_4: UAV_Frame_7_1 
		{
			x = "safezoneX + SafezoneW - (0.015) - 0.15 * 0.034*1*25 + 0.15 * 0.034*1*25";
			w = "0.003 * safezoneH * 3/4";
			h = "0.034*1";
		};	
		class MouseHandler: RscControlsGroup
		{
			idc=1;
			x = safeZoneX;
			y = safeZoneY;
			w = safeZoneW;
			h = safeZoneH;
			onMouseMoving="WF_Logic setVariable ['uav_cam_move',[_this select 1,_this select 2]]";
			onMouseZChanged="WF_Logic setVariable ['uav_cam_fov',_this select 1]";
		};	
		class PlayerNameDisp:RscStructuredText
		{
			x = 0.5;
			y = 0.5;
			w = 0.25;
			h = 0.2;
			sizeEx=0.028;
			size=0.028;
			lineSpacing=1;
			colorText[]={1,1,1,0.5};
			colorBackground[]={0,0,0,0};
			class Attributes
			{
				font=Zeppelin32;
				color="#ffffff";
				align="left";
				shadow=false;
			};
		};			
		class Player01:PlayerNameDisp {idc=6020;};
		class Player02:PlayerNameDisp {idc=6021;};
		class Player03:PlayerNameDisp {idc=6022;};
		class Player04:PlayerNameDisp {idc=6023;};
		class Player05:PlayerNameDisp {idc=6024;};
		class Player06:PlayerNameDisp {idc=6025;};
		class Player07:PlayerNameDisp {idc=6026;};
		class Player08:PlayerNameDisp {idc=6027;};
		class Player09:PlayerNameDisp {idc=6028;};
		class Player10:PlayerNameDisp {idc=6029;};
		class Player11:PlayerNameDisp {idc=6030;};
		class Player12:PlayerNameDisp {idc=6031;};
		class Player13:PlayerNameDisp {idc=6032;};
		class Player14:PlayerNameDisp {idc=6033;};
		class Player15:PlayerNameDisp {idc=6034;};
		class Player16:PlayerNameDisp {idc=6035;};
		class Player17:PlayerNameDisp {idc=6036;};
		class Player18:PlayerNameDisp {idc=6037;};
		class Player19:PlayerNameDisp {idc=6038;};
		class Player20:PlayerNameDisp {idc=6039;};
		class Player21:PlayerNameDisp {idc=6040;};
		class Player22:PlayerNameDisp {idc=6041;};
		class Player23:PlayerNameDisp {idc=6042;};
		class Player24:PlayerNameDisp {idc=6043;};
		class Player25:PlayerNameDisp {idc=6044;};
		class Player26:PlayerNameDisp {idc=6045;};
		class Player27:PlayerNameDisp {idc=6046;};
		class Player28:PlayerNameDisp {idc=6047;};
		class Player29:PlayerNameDisp {idc=6048;};
		class Player30:PlayerNameDisp {idc=6049;};
		class Player31:PlayerNameDisp {idc=6050;};
		class Player32:PlayerNameDisp {idc=6051;};
		class Player33:PlayerNameDisp {idc=6052;};
		class Player34:PlayerNameDisp {idc=6053;};
		class Player35:PlayerNameDisp {idc=6054;};
		class Player36:PlayerNameDisp {idc=6055;};
		class Player37:PlayerNameDisp {idc=6056;};
		class Player38:PlayerNameDisp {idc=6057;};
		class Player39:PlayerNameDisp {idc=6058;};
		class Player40:PlayerNameDisp {idc=6059;};
		class Player41:PlayerNameDisp {idc=6060;};
		class Player42:PlayerNameDisp {idc=6061;};
		class Player43:PlayerNameDisp {idc=6062;};
		class Player44:PlayerNameDisp {idc=6063;};
		class Player45:PlayerNameDisp {idc=6064;};
		class Player46:PlayerNameDisp {idc=6065;};
		class Player47:PlayerNameDisp {idc=6066;};
		class Player48:PlayerNameDisp {idc=6067;};
		class Player49:PlayerNameDisp {idc=6068;};
		class Player50:PlayerNameDisp {idc=6069;};
		class Player51:PlayerNameDisp {idc=6070;};
		class Player52:PlayerNameDisp {idc=6071;};
		class Player53:PlayerNameDisp {idc=6072;};
		class Player54:PlayerNameDisp {idc=6073;};
		class Player55:PlayerNameDisp {idc=6074;};
		class Player56:PlayerNameDisp {idc=6075;};
		class Player57:PlayerNameDisp {idc=6076;};
		class Player58:PlayerNameDisp {idc=6077;};
		class Player59:PlayerNameDisp {idc=6078;};
		class Player60:PlayerNameDisp {idc=6079;};
		class DirN: RscText
		{
			idc = 7000;
			type=0;
			style="0x00 + 0x200";			
			x = 0;
			y = 0;
			h = 0.05;
			w = 0.05;
			SizeEx = "0.020";
			text="N";
			colorText[] = {0.4,0.9,0.2784,1.0};
			colorBackground[] = {0, 0, 0, 0};
		};
		class DirS: DirN
		{
			idc=7001;
			text="S";
		};
		class DirE: DirN
		{
			idc=7002;
			text="E";
		};
		class DirW: DirN
		{
			idc=7003;
			text="W";
		};
		class DirU: DirN
		{
			idc=7004;
			style=64;
			text="";
			h = 0.02;
			w = 0.014976;
		};
	};		
};

class RscUAVMap
{
	movingEnable = 0;
	idd = -1;
	onLoad = "UAV_MapActive=true; private['_dialog','_uav','_map']; disableSerialization; _uav=Local_PlayerVehicle getVariable 'uav_active'; _dialog=_this select 0; _map=_dialog displayCtrl 15001; _map ctrlMapAnimAdd [0,(speed _uav+8)/200,position _uav]; ctrlMapAnimCommit _map;";
	onUnLoad = "UAV_MapActive=false";
	onKeyDown="";
	onKeyUp="";
	class controlsBackground 
	{
	};
	class controls
	{
		class WF_MiniMap : RscMapControl 
		{
			IDC = 15001;
			ShowCountourInterval = 1;
			x = safezoneX;
			y = safezoney;
			w = safezoneW;
			h = safezoneH;

			onMouseMoving = "";
			onMouseButtonDown = "";
			onMouseButtonUp = "";
		};
	};
};