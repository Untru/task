&НаКлиенте
Процедура ИзменениеДоступностиОбращенияПоУмолчанию()
	Если Объект.ТипПрименяемыхОбращений = ОбщийМодульСервер.ПолучитьТипПрименяемыхОбращений("ВнутренниеИВнешние") Тогда
		ЭтаФорма.Элементы.ОбращенияПоУмолчанию.Доступность = Истина; 
	Иначе
		ЭтаФорма.Элементы.ОбращенияПоУмолчанию.Доступность = Ложь;
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ИзменениеДоступностиОбращенияПоУмолчанию(); 
КонецПроцедуры

&НаКлиенте
Процедура ТипПрименяемыхОбращенийПриИзменении(Элемент)
	ИзменениеДоступностиОбращенияПоУмолчанию();
КонецПроцедуры
