// Кокорев В.Н Начало 13.10.2014
//Функция ПолучитьЦветИзПоляXDTO(Параметр) Экспорт
//	ТипОбъектаXDTO=ФабрикаXDTO.Тип("http://v8.1c.ru/8.1/data/ui","Color");
//	ЧтениеXML = Новый ЧтениеXML;
//	ЧтениеXML.УстановитьСтроку(СокрЛП(Параметр));
//	ОбъектXDTO = ФабрикаXDTO.ПрочитатьXML(ЧтениеXML,ТипОбъектаXDTO);
//	ЧтениеXML.Закрыть();
//	Сериализатор=Новый СериализаторXDTO(ФабрикаXDTO);
//	Возврат Сериализатор.ПрочитатьXDTO(ОбъектXDTO);
//КонецФункции	

//Функция ПроверкаРасширенияРаботыСФайлами() Экспорт
//	 РасширениеПодключено = ПодключитьРасширениеРаботыСФайлами();

//	 ЗначениеВозврата = Истина;
//	 //если подключить не удалось - требуется установить его (в первый раз)
//     Если НЕ РасширениеПодключено Тогда
//          //устанавливаем
//          //УстановитьРасширениеРаботыСФайлами();
//		  //НачатьУстановкуРасширенияРаботыСФайлами();
//		  ОткрытьФорму("ОбщаяФорма.ВопросОбУстановкеРасширенияРаботыСФайлами", ПараметрыФормы,,,,,Оповещение);
//          //если не удалось установить - то повторный вызов подключения будет неудачный
//		  //Если НЕ ПодключитьРасширениеРаботыСФайлами() Тогда
//		  //     ЗначениеВозврата = Ложь;
//		  //КонецЕсли;
//	    
//	   КонецЕсли;
//	   Это мастер
//	  Возврат ЗначениеВозврата;
// КонецФункции	
//Тест
//тест2
// Это докПроджектяяя
// Управление расширением
// Паша тест
&НаКлиенте
Процедура ПроверитьПодключениеРасширения(Оповещение) Экспорт
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("Оповещение",Оповещение);
	ОповещениеПодключения = Новый ОписаниеОповещения("ПодключеноРасширение",ЭтотОбъект ,ДопПараметры);

	НачатьПодключениеРасширенияРаботыСФайлами(ОповещениеПодключения);
КонецПроцедуры

&НаКлиенте
Процедура ПодключеноРасширение(Подключено,ДопПараметры) Экспорт
	Если Подключено = Истина Тогда
		 ВыполнитьОбработкуОповещения(ДопПараметры.Оповещение);
	 Иначе
		ДопПараметры = Новый Структура;
		ДопПараметры.Вставить("Оповещение",ДопПараметры.Оповещение);
		ОповещениеЗакрытия = Новый ОписаниеОповещения("УстановкаРасширения", ЭтотОбъект,ДопПараметры);
		ОткрытьФорму("ОбщаяФорма.ВопросОбУстановкеРасширенияРаботыСФайлами",,,,,,ОповещениеЗакрытия);
	КонецЕсли;	
КонецПроцедуры	

&НаКлиенте
Процедура УстановкаРасширения(Действия,ДопПараметры) Экспорт
	Если Действия = "Подключено" Тогда
		 ВыполнитьОбработкуОповещения(ДопПараметры.Оповещение);
	КонецЕсли;	
КонецПроцедуры	




