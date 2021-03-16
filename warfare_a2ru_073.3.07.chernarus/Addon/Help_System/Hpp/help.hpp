#define GUI_GRID_X	(safezoneX)
#define GUI_GRID_Y	(safezoneY)
#define GUI_GRID_W	(safezoneW / 40)
#define GUI_GRID_H	(safezoneH / 25)
#define GUI_GRID_WAbs	(safezoneW)
#define GUI_GRID_HAbs	(safezoneH)
#define CT_HTML             9


//Standard HTML control.
class RscHTML
{
	type = CT_HTML;
	idc = -1;
	style = 0;
	filename = "";
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	colorBold[] = {0, 0, 0, 1};
	colorLink[] = {0.05, 0.20, 0.05, 1};
	colorLinkActive[] = {0, 0, 0.20, 1};
	colorPicture[] = {1, 1, 1, 1};
	colorPictureLink[] = {1, 1, 1, 1};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorPictureBorder[] = {0, 0, 0, 0};
	tooltipColorText[] = {0, 0, 0, 1};
	tooltipColorBox[] = {0, 0, 0, 0.50};
	tooltipColorShade[] = {1, 1, 0.70, 1};
	//align="left";

	class H1
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.024740;
	};
	class H2
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.028646;
	};
	class H3
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.028646;
	};
	class H4
	{
		font = "Zeppelin33Italic";
		fontBold = "Zeppelin33";
		sizeEx = 0.020833;
	};
	class H5
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.020833;
	};
	class H6
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 0.020833;
	};
	class P
	{
		font = "Zeppelin32";
		fontBold = "Zeppelin33";
		sizeEx = 12*((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * GUI_GRID_H;
	};
	prevPage = "\ca\ui\data\arrow_left_ca.paa";
	nextPage = "\ca\ui\data\arrow_right_ca.paa";
};


class RscActiveText
{
	type = CT_CLICKABLETEXT;	
	idc = -1;	 
	style = ST_LEFT;	 
	color[] = {1, 1, 1, 1};	
	colorActive[] = {1, 1, 1, 1};	
	colorDisabled[] = {1, 1, 1, 1};		
	font = "Zeppelin32";
	sizeEx = 0.04;
	soundEnter[] = {"ui\ui_over", 0.2, 1}; 
	soundPush[] = {, 0.2, 1};
	soundClick[] = {"ui\ui_ok", 0.2, 1};
	soundEscape[]	= {"ui\ui_cc", 0.2, 1};
	default = false;	 
};


class WF_Help_System{
	idd = 20000;
	name= "Help_System";
	onLoad = "[''] execVM 'Addon\Help_System\WF_help_System.sqf'";
			class controls {
					class ButtonBack: RscActiveText
					{
								idc = 2;
								style = 48;
								color[] = {1,1,1,0.7};
								text = "\ca\ui\data\marker_x_ca.paa"; //--- ToDo: Localize;
								x = 31.9 * GUI_GRID_W + GUI_GRID_X;
								y = 1.8 * GUI_GRID_H + GUI_GRID_Y;
								w = 0.93 * GUI_GRID_W;
								h = 0.93 * GUI_GRID_H;
								colorText[] = {1,1,1,0.7};
								colorActive[] = {1,1,1,1};
								tooltip = "Close"; //--- ToDo: Localize;
					};
					class WFHS_backgroung:RscText
					{
						idc = -1;
						x = 2.65 * GUI_GRID_W + GUI_GRID_X;
						y = 2.73 * GUI_GRID_H + GUI_GRID_Y;
						w = 30 * GUI_GRID_W;
						h = 19.5 * GUI_GRID_H;
						colorBackground[] = {0.05,0.05,0.05,0.7};
					};
					class WFHS_LB_Topics_backgroung:RscText
					{
						idc = -1;
						x = 2.8 * GUI_GRID_W + GUI_GRID_X;
						y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
						w = 7 * GUI_GRID_W;
						h = 19 * GUI_GRID_H;
						colorBackground[] = {0.05,0.05,0.05,0.6};
					};					
					class WFHS_LB_Topics : RscListBox
					{
						idc = 20001;
						onLBSelChanged = "['WFHS_LB_Topics','empty',0,0] execVM 'Addon\Help_System\Scripts\EventDLG.sqf'";
						x = 2.8 * GUI_GRID_W + GUI_GRID_X;
						y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
						w = 7 * GUI_GRID_W;
						h = 19 * GUI_GRID_H;
						rowHeight = 0.03;
						colorBackground[] = {0.05,0.05,0.05,1};					
					};
					class WFHS_LB_Hint_backgroung:RscText
					{
						idc = -1;
						x = 9.85 * GUI_GRID_W + GUI_GRID_X;
						y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
						w = 7 * GUI_GRID_W;
						h = 19 * GUI_GRID_H;
						colorBackground[] = {0.05,0.05,0.05,0.6};
					};
					class WFHS_LB_Hint : RscListBox
					{
						idc = 20002;
						onLBSelChanged = "['WFHS_LB_Hint','empty',0,0] execVM 'Addon\Help_System\Scripts\EventDLG.sqf'";
						x = 9.85 * GUI_GRID_W + GUI_GRID_X;
						y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
						w = 7 * GUI_GRID_W;
						h = 19 * GUI_GRID_H;
						rowHeight = 0.03;
						colorBackground[] = {0.05,0.05,0.05,1};					
					};

					
									class WFHS_RST_Hint: RscHTML
									{
										idc = 20003;
										x = 17 * GUI_GRID_W + GUI_GRID_X;
										y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
										w = 15.5 * GUI_GRID_W;
										h = 19 * GUI_GRID_H;
										filename = "test.html";
										text="";
										//colorBackground[] = {0.05,0.05,0.05,1};								
									};
									
				/*	class WFHS_RST_Hint_Group : RscControlsGroup
					{
									x = 17 * GUI_GRID_W + GUI_GRID_X;
									y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
									w = 15.5 * GUI_GRID_W;
									h = 19 * GUI_GRID_H;
							class Controls 
							{

							};
					};*/


					/*class WFHS_RST_Hint_backgroung:RscText
					{
						idc = -1;
						x = 17 * GUI_GRID_W + GUI_GRID_X;
						y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
						w = 15 * GUI_GRID_W;
						h = 19 * GUI_GRID_H;
						colorBackground[] = {0.05,0.05,0.05,0.7};
					};*/
					
					
					
					
					class interactiveMenu: RscText
						{
							idc = 3600;
							text = "Hello";
							x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
							y = safeZoneY + (safeZoneH * (1 - (0.20 / SafeZoneH)));
							w = 0.14; 
							h = 0.20;
							class Attributes 
							{
										align = "right";
							};
						};

				
				};
};				
