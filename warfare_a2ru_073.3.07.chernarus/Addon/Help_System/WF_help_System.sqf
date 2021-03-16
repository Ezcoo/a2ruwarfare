disableSerialization;
_array_WFHS_LB_Topics=[];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Правила серверов arma2.Ru','0']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['О миссии','1']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Индивидуальный пехотный бой','2']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Пехотный бой в качестве командира отделения ботов','3']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Использование транспортных средств','4']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Авиация','5']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Артиллерия','6']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Тактика захвата и обороны селения','7']];
_array_WFHS_LB_Topics= _array_WFHS_LB_Topics + [['Тактика захвата и обороны бункеров','8']];
{
	_Number = lbAdd [20001, _x select 0];
	lbSetData [20001, _Number, _x select 1];
}foreach _array_WFHS_LB_Topics;

lbSetCurSel [20001, 0];
lbSetCurSel [20002, 0];




 
 
 