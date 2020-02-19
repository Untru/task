
#Область Печать

Процедура Печать(МассивОбъектов, ПараметрыПечати, ИмяМакета, ТабличныйДокумент) Экспорт
	Если ИмяМакета = "ЛистУчетаРабочегоВремени" Тогда 
		СформироватьПечатнуюФормуЛистУчетаРабочегоВремени(МассивОбъектов, ПараметрыПечати, ТабличныйДокумент);
	КонецЕсли;
КонецПроцедуры

Процедура СформироватьПечатнуюФормуЛистУчетаРабочегоВремени(МассивОбъектов, ПараметрыПечати, ТабличныйДокумент)
	УстановитьПривилегированныйРежим(Истина);
	
	//ТабличныйДокумент = Новый ТабличныйДокумент;
	ТабличныйДокумент.ПолеСлева = 5;
	ТабличныйДокумент.ПолеСправа = 5;
	ТабличныйДокумент.РазмерКолонтитулаСверху = 0;
	ТабличныйДокумент.РазмерКолонтитулаСнизу = 0;
	ТабличныйДокумент.АвтоМасштаб = Истина;
	ТабличныйДокумент.ОриентацияСтраницы = ОриентацияСтраницы.Ландшафт;

	ТабличныйДокумент.КлючПараметровПечати = "ПАРАМЕТРЫ_ПЕЧАТИ_ЛистУчетаРабочегоВремени";
	
		
	ДанныеДляПечати = ПолучитьДанныеДляПечатнойФормыЛистУчетаРабочегоВремени(МассивОбъектов);
	
	ЗаполнитьТабличныйДокументСводной(ТабличныйДокумент, ДанныеДляПечати, ПараметрыПечати);
КонецПроцедуры

Процедура ЗаполнитьТабличныйДокументСводной(ТабличныйДокумент, ДанныеДляПечати, ПараметрыПечати)
	
	Макет = Документы.РасчетыПоРаботам.ПолучитьМакет("ЛУРВСтандартнаяФорма");
	
	//Области
	ОбластьШапка		= Макет.ПолучитьОбласть("Шапка");
	ОбластьШапкаТаблицы	= Макет.ПолучитьОбласть("ШапкаТаблицы");  
	ОбластьСтрока		= Макет.ПолучитьОбласть("ВыполненыеРаботы");
	ОбластьПодвал		= Макет.ПолучитьОбласть("Подвал");
	
	ДанныеШапки			= ДанныеДляПечати.РезультатПоШапке.Выбрать();
	ВыборкаПоДокументам	= ДанныеДляПечати.РезультатПоТабличнойЧасти.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	ПервыйДокумент = Истина;
	Пока ДанныеШапки.Следующий() Цикл
		
		ОбластьШапка.Параметры.Заполнить(ДанныеШапки);
		
		СтруктураПоиска = Новый Структура("Ссылка", ДанныеШапки.Ссылка);
		ВыборкаПоДокументам.Сбросить();
		Если НЕ ВыборкаПоДокументам.НайтиСледующий(СтруктураПоиска) Тогда
			Продолжить;
		КонецЕсли;
		
		Если Не ПервыйДокумент Тогда
			ТабличныйДокумент.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;
		ПервыйДокумент = Ложь;
		
		ОбластьПодвал.Параметры.Заполнить(ВыборкаПоДокументам);
		ОбластьПодвал.Параметры.ОбъемЧасов = "" + ВыборкаПоДокументам.Стоимость + " рублей, "+ 	ОбластьПодвал.Параметры.ОбъемЧасов +" часов.";
		
		ТабличныйДокумент.Вывести(ОбластьШапка);
		ТабличныйДокумент.Вывести(ОбластьШапкаТаблицы);
		
		СтрокаТовары = ВыборкаПоДокументам.Выбрать();
		КоличествоСтрок = СтрокаТовары.Количество();
		НомерСтроки = 0;
		Пока СтрокаТовары.Следующий() Цикл
			НомерСтроки = НомерСтроки + 1;
			ОбластьСтрока.Параметры.Заполнить(СтрокаТовары);
			
			МассивВыводимыхОбластей = Новый Массив;
			МассивВыводимыхОбластей.Добавить(ОбластьСтрока);
			
			Если НомерСтроки = КоличествоСтрок Тогда
				МассивВыводимыхОбластей.Добавить(ОбластьПодвал);
			КонецЕсли;
			
			Если НЕ ТабличныйДокумент.ПроверитьВывод(МассивВыводимыхОбластей) Тогда
				ТабличныйДокумент.ВывестиГоризонтальныйРазделительСтраниц();
				ТабличныйДокумент.Вывести(ОбластьШапкаТаблицы);
			КонецЕсли;
			
			ТабличныйДокумент.Вывести(ОбластьСтрока);
		КонецЦикла;

		ТабличныйДокумент.Вывести(ОбластьПодвал);
	КонецЦикла;
	
КонецПроцедуры

#Область ДанныеДляПечати

Функция ПолучитьДанныеДляПечатнойФормыЛистУчетаРабочегоВремени(МассивОбъектов)
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("МассивОбъектов", МассивОбъектов);
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	РасчетыПоРаботам.Ссылка КАК Ссылка,
	|	РасчетыПоРаботам.Дата КАК Дата,
	|	ВЫБОР
	|		КОГДА РасчетыПоРаботам.ВидОперации = ЗНАЧЕНИЕ(Перечисление.ВидыОперацийРасчетов.ОплатаЗаказчиком)
	|			ТОГДА РасчетыПоРаботам.Отделение
	|		ИНАЧЕ ""Чегодаев Павел Сергеевич""
	|	КОНЕЦ КАК Контрагент,
	|	ВЫБОР
	|		КОГДА РасчетыПоРаботам.ВидОперации = ЗНАЧЕНИЕ(Перечисление.ВидыОперацийРасчетов.ОплатаЗаказчиком)
	|			ТОГДА ""Чегодаев Павел Сергеевич""
	|		ИНАЧЕ РасчетыПоРаботам.Исполнитель
	|	КОНЕЦ КАК Сотрудник
	|ИЗ
	|	Документ.РасчетыПоРаботам КАК РасчетыПоРаботам
	|ГДЕ
	|	РасчетыПоРаботам.Ссылка В(&МассивОбъектов)
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	РасчетыПоРаботамРасшифровка.Ссылка КАК Ссылка,
	|	РасчетыПоРаботамРасшифровка.Задача.Дата КАК ДатаРаботы,
	|	РасчетыПоРаботамРасшифровка.Задача.ДатаНачалаПлан КАК ДатаНачалаПлан,
	|	РасчетыПоРаботамРасшифровка.Задача.ДатаОкончанияПлан КАК ДатаОкончанияПлан,
	|	РасчетыПоРаботамРасшифровка.Задача.ОбъемЧасов КАК ОбъемЧасов,
	|	РасчетыПоРаботамРасшифровка.Задача.Заголовок КАК Заголовок,
	|	РасчетыПоРаботамРасшифровка.Задача.ТекущийСтатус КАК ТекущийСтатус,
	|	РасчетыПоРаботамРасшифровка.Задача.Описание КАК Описание,
	|	РасчетыПоРаботамРасшифровка.Задача.ОбращениеОт КАК ОбращениеОт,
	|	РасчетыПоРаботамРасшифровка.Задача.СтоимостьРабот КАК Стоимость
	|ИЗ
	|	Документ.РасчетыПоРаботам.Расшифровка КАК РасчетыПоРаботамРасшифровка
	|ГДЕ
	|	РасчетыПоРаботамРасшифровка.Ссылка В(&МассивОбъектов)
	|ИТОГИ
	|	СУММА(ОбъемЧасов),
	|	СУММА(Стоимость)
	|ПО
	|	Ссылка";
	
	МассивРезультатов			= Запрос.ВыполнитьПакет();
	РезультатПоШапке 			= МассивРезультатов[0];
	РезультатПоТабличнойЧасти	= МассивРезультатов[1];
	СтруктураДанныхДляПечати	= Новый Структура("РезультатПоШапке, РезультатПоТабличнойЧасти",
                                               	   РезультатПоШапке, РезультатПоТабличнойЧасти);
	
	Возврат СтруктураДанныхДляПечати;
КонецФункции
#КонецОбласти

#КонецОбласти
