
	_t = _this select 0 ;
	
	_array_WFHS_LB_Hint=[];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Основные правила','0',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Чего не надо делать во время игры','0',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['О миссии ','1',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Цели миссии ','1',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Возможности','1',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Если вас убили','1',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Главный бункер','1',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Особые навыки слотов','1',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['1. Передвижение','2',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['2. Обнаружение противника','2',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['3. Уничтожение противника','2',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['4. Пехота против брони','2',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['5. Пехота против авиации','2',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Общее','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Идти','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Цель (2-...)','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Поведение в бою (3-...)','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Сесть в (4-...)','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Статус (5-...)','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Действие (6-...)','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Режим боя (7-...)','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Опция Боевой порядок (8-...)','3',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Советы','3',0]];
	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Общее','4',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Боевое применение лёгкой техники','4',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Боевое применение тяжёлой техники(танков)','4',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Противовоздушная оборона','4',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Инженерный грузовик','4',0]];
	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Общее','5',0]];	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Вертолеты','5',0]];	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Самолеты','5',0]];	
	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Общее','6',0]];	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Д-30','6',0]];	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['М 119','6',0]];	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Поднос - 2В14-1','6',0]];	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Миномёт 81-мм М252','6',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Ведение огня','6',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Применение артиллерии','6',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Всякое','6',0]];
	
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Общее','7',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Захват селения','7',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Оборона селений','7',0]];
	_array_WFHS_LB_Hint= _array_WFHS_LB_Hint + [['Общее','8',0]];
	
	
	disableSerialization;
					switch (_t) do
					{

						case "WFHS_LB_Topics" :
							{	
									_control = findDisplay 20000 displayCtrl 20002;
									lbClear _control;

									
									
									_index = lbCurSel 20001;
									_data = lbData [20001, _index];
									{
										if ( _x select 1 == _data) then
										{	
											_Number = lbAdd [20002, _x select 0];
											lbSetData [20002, _Number, _x select 1];
											lbSetValue [20002, _Number, _x select 1];
										};
									}foreach _array_WFHS_LB_Hint;
									lbSetCurSel [20002, 0];
							};
						case "WFHS_LB_Hint" :
							{	
									
								_iii = format["%1_%2",lbData [20001, lbCurSel 20001],lbCurSel 20002];
								_control = findDisplay 20000 displayCtrl 20003;
								_control htmlLoad format["addon\Help_System\Html\%1\%2_%3.html",localize "STR_HELPSYSTEMFOLDER",lbData [20001, lbCurSel 20001],lbCurSel 20002];
							};
							
					};