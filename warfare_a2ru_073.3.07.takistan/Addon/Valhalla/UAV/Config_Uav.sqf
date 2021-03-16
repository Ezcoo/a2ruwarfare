/*[uav_type,[[attach_camera_pos],cam_max_dive,cam_min_dive,cam_max_fov,cam_min_fov,uav_cam_dialog,uav_land_function,[uav_towing params:[front_wheel_pos],[front_axis_pos]]]]*/
UAV_VehicleTypes=[["Pchela1T",[[0,1.2,0],-85,10,0.07,0.7,"RscUAVDialogRUS","[_this,'ParachuteEast',[0,0,-0.6]] spawn Func_UAV_LandPlane",[]]],
				  ["MQ9PredatorB",[[0,3.8,-1.3],-85,10,0.035,0.7,"RscUAVDialogUS","[_this,'ParachuteMediumWest',[0,0,-0.6]] spawn Func_UAV_LandPlane",[[0,2],[0,7]]]],
				  ["Ka137_PMC",[[0,0,-1.0],-85,10,0.07,0.7,"RscUAVDialogRUS","[_this] spawn Func_UAV_LandHeli",[]]],
				  ["AH6X_EP1",[[0,2.5,-1.8],-85,10,0.07,0.7,"RscUAVDialogUS","[_this] spawn Func_UAV_LandHeli",[[0,2],[0,5]]]]];
/*[[terminal_type,[[transportable_uav_#1,[attach_pos_if_attachable]],[transportable_uav_#2,[attach_pos_if_attachable]]],[towing_axis_pos]]]*/
UAV_TerminalTypes=[["M113_TK_EP1",[["Pchela1T",[0.4,-2,-0.55]],["Ka137_PMC",[0.4,-1.2,0.35]],["MQ9PredatorB",[]],["AH6X_EP1",[]]],[0,-4]],
				   ["HMMWV_Terminal_EP1",[["Pchela1T",[0,-1.5,0.75]],["Ka137_PMC",[0,-1.5,1.7]],["MQ9PredatorB",[]],["AH6X_EP1",[0,-2.6,2.5]]],[0,-4]]];