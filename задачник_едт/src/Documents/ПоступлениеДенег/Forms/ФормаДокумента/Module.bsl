

&НаКлиенте
Процедура РасшифровкаПлатежаСуммаПриИзменении(Элемент)
	ОбновитьНераспределеннуюСумму();
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьНераспределеннуюСумму()
	НераспределеннаяСумма = Объект.Сумма - Объект.РасшифровкаПлатежа.Итог("Сумма");
	Элементы.НераспределеннаяСумма.Видимость = (НераспределеннаяСумма <> 0);
КонецПроцедуры

&НаКлиенте
Процедура СуммаПриИзменении(Элемент)
	ОбновитьНераспределеннуюСумму();
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьРасшифровку(Команда)
	Если Объект.РасшифровкаПлатежа.Количество() Тогда
		ОписаниеЗавершения = Новый ОписаниеОповещения("ЗаполнитьРасшифровкуФрагмент", ЭтотОбъект);
		ПоказатьВопрос(ОписаниеЗавершения, "Строки будут удалены. Продолжить?", РежимДиалогаВопрос.ДаНет);
	Иначе
		ЗаполнитьРасшифровкуНаСервере();
		ОбновитьНераспределеннуюСумму();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьРасшифровкуФрагмент(Ответ, Параметры) Экспорт
	Если Ответ = КодВозвратаДиалога.Нет Тогда
        Возврат;
    КонецЕсли;

	ЗаполнитьРасшифровкуНаСервере();
	ОбновитьНераспределеннуюСумму();
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьРасшифровкуНаСервере()
	
	Объект.РасшифровкаПлатежа.Очистить();
	
	Запрос = Новый Запрос;
	Если Объект.ВидРасчета = Перечисления.ВидыРасчета.СПартнером Тогда
		Запрос.Текст = ТекстЗапросаПоПартнерам();
	Иначе
		Запрос.Текст = ТекстЗапросаПоКлиентам();
		Запрос.УстановитьПараметр("Контрагент", Объект.Контрагент);
	КонецЕсли;
	
	РезультатЗапроса = Запрос.Выполнить();
	Выборка = РезультатЗапроса.Выбрать();
	Пока Выборка.Следующий() И Объект.Сумма > Объект.РасшифровкаПлатежа.Итог("Сумма") Цикл
		НоваяСтрокаРасшифровки = Объект.РасшифровкаПлатежа.Добавить();
		НоваяСтрокаРасшифровки.Этап = Выборка.Этап;
		НоваяСтрокаРасшифровки.Сумма = Мин(Объект.Сумма - Объект.РасшифровкаПлатежа.Итог("Сумма"), Выборка.Сумма)
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Функция ТекстЗапросаПоКлиентам()
	Возврат "ВЫБРАТЬ
		|	ВзаиморасчетыСКлиентамиОстатки.Этап КАК Этап,
		|	ВзаиморасчетыСКлиентамиОстатки.СуммаКОплатеОстаток КАК Сумма
		|ИЗ
		|	РегистрНакопления.ВзаиморасчетыСКлиентами.Остатки КАК ВзаиморасчетыСКлиентамиОстатки
		|ГДЕ
		|	ВзаиморасчетыСКлиентамиОстатки.Контрагент = &Контрагент";
КонецФункции

&НаСервере
Функция ТекстЗапросаПоПартнерам()
	Возврат "ВЫБРАТЬ
	|	ВзаиморасчетыСПартнерамиОстатки.Этап КАК Этап,
	|	ВзаиморасчетыСПартнерамиОстатки.СуммаКОплатеОстаток КАК Сумма
	|ИЗ
	|	РегистрНакопления.ВзаиморасчетыСПартнерами.Остатки КАК ВзаиморасчетыСПартнерамиОстатки";
КонецФункции

