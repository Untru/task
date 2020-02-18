#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции

#Область Проведение

Процедура ИнициализироватьДанныеДокумента(ДокументСсылка, ДополнительныеСвойства, Регистры = Неопределено) Экспорт
	
	////////////////////////////////////////////////////////////////////////////
	// Создадим запрос инициализации движений
	
	Запрос = Новый Запрос;
	ЗаполнитьПараметрыИнициализации(Запрос, ДокументСсылка);
	
	////////////////////////////////////////////////////////////////////////////
	// Сформируем текст запроса
	
	ТекстыЗапроса = Новый СписокЗначений;
	ТекстЗапросаТаблицаСебестоимость(Запрос, ТекстыЗапроса, Регистры);
	ТекстЗапросаТаблицаВзаиморасчетыСИсполнителями(Запрос, ТекстыЗапроса, Регистры);
	
	ПроведениеСервер.ИнициализироватьТаблицыДляДвижений(Запрос, ТекстыЗапроса, ДополнительныеСвойства.ТаблицыДляДвижений, Истина);
	
КонецПроцедуры

Процедура ЗаполнитьПараметрыИнициализации(Запрос, ДокументСсылка)
	
	Запрос.МенеджерВременныхТаблиц = Новый МенеджерВременныхТаблиц;
	Запрос.УстановитьПараметр("Ссылка", ДокументСсылка);
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ДанныеДокумента.Ссылка КАК Ссылка,
	|	ДанныеДокумента.Дата КАК Период,
	|	ДанныеДокумента.ЭтапПроекта КАК ЭтапПроекта,
	|	ДанныеДокумента.Себестоимость КАК Себестоимость,
	|	ДанныеДокумента.ПометкаУдаления,
	|	ДанныеДокумента.Проведен,
	|	ДанныеДокумента.Номер
	|ИЗ
	|	Документ.ОбращениеВПоддержку КАК ДанныеДокумента
	|ГДЕ
	|	ДанныеДокумента.Ссылка = &Ссылка";
	Реквизиты = Запрос.Выполнить().Выбрать();
	Реквизиты.Следующий();
	
	Запрос.УстановитьПараметр("Период",            Реквизиты.Период);
	Запрос.УстановитьПараметр("ЭтапПроекта",       Реквизиты.ЭтапПроекта);
	Запрос.УстановитьПараметр("Себестоимость",     Реквизиты.Себестоимость);
	Запрос.УстановитьПараметр("Номер",             Реквизиты.Номер);
	Запрос.УстановитьПараметр("ПометкаУдаления",   Реквизиты.ПометкаУдаления);
	Запрос.УстановитьПараметр("Проведен",          Реквизиты.Проведен);
	
КонецПроцедуры

Функция ТекстЗапросаТаблицаСебестоимость(Запрос, ТекстыЗапроса, Регистры)
	ИмяРегистра = "Себестоимость";
	
	Если НЕ ПроведениеСервер.ТребуетсяТаблицаДляДвижений(ИмяРегистра, Регистры) Тогда
		Возврат "";
	КонецЕсли; 
	
	ТекстЗапроса = 
	"ВЫБРАТЬ
	|	ЗНАЧЕНИЕ(ВидДвиженияНакопления.Приход) КАК ВидДвижения,
	|	&Период КАК Период,
	|	&ЭтапПроекта КАК Этап,
	|	ЗНАЧЕНИЕ(Справочник.СтатьиЗатрат.ПустаяСсылка) КАК СтатьяЗатрат,
	|	ЗНАЧЕНИЕ(Перечисление.ВидыЗатрат.ПустаяСсылка) КАК ВидЗатрат,
	|	0 КАК ПлановаяСтоимость,
	|	ОбращениеВПоддержку.Себестоимость КАК Себестоимость,
	|	0 КАК ДополнительныеЗатраты
	|ИЗ
	|	Документ.ОбращениеВПоддержку КАК ОбращениеВПоддержку
	|ГДЕ
	|	ОбращениеВПоддержку.Ссылка = &Ссылка";
	
	ТекстыЗапроса.Добавить(ТекстЗапроса, ИмяРегистра);
	
	Возврат ТекстЗапроса;
	
КонецФункции

Функция ТекстЗапросаТаблицаВзаиморасчетыСИсполнителями(Запрос, ТекстыЗапроса, Регистры)
	ИмяРегистра = "ВзаиморасчетыСИсполнителями";
	
	Если НЕ ПроведениеСервер.ТребуетсяТаблицаДляДвижений(ИмяРегистра, Регистры) Тогда
		Возврат "";
	КонецЕсли; 
	
	ТекстЗапроса = 
	"ВЫБРАТЬ
	|	ЗНАЧЕНИЕ(ВидДвиженияНакопления.Приход) КАК ВидДвижения,
	|	&Период КАК Период,
	|	ОбращениеВПоддержку.РеальныйИсполнитель КАК Исполнитель,
	|	&Ссылка КАК Задача,
	|	ОбращениеВПоддержку.Себестоимость КАК Сумма
	|ИЗ
	|	Документ.ОбращениеВПоддержку КАК ОбращениеВПоддержку
	|ГДЕ
	|	ОбращениеВПоддержку.Ссылка = &Ссылка";
	
	ТекстыЗапроса.Добавить(ТекстЗапроса, ИмяРегистра);
	
	Возврат ТекстЗапроса;
	
КонецФункции

#КонецОбласти

#КонецОбласти

#КонецЕсли