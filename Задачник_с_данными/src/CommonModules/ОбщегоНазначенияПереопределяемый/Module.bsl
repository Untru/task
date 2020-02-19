
// Возвращает список имен объектов метаданных, данные которых могут содержать ссылки на различные объекты метаданных,
// но при этом эти ссылки не должны учитываться в бизнес-логике приложения.
//
// Пример:
// Для документ "Реализация товаров и услуг" настроена подсистема версионирования объектов,
// и подсистема свойств. При этом на экземпляр документа может быть множество ссылок 
// в информационной базе (из других документов, регистров). Часть ссылок имеют значение для бизнес-логики
// (например движения по регистрам). Другая часть ссылок - "техногенные" ссылки на объект из объектов ИБ,
// которые относятся к подсистеме версионирования объектов и подсистеме свойств. Такие "техногенные"
// ссылки должны быть отфильтрованы, например, в обработке удаления помеченных и при поиске ссылок на объект
// в подсистеме запрета редактирования ключевых реквизитов.
// Список таких "техногенных" объектов нужно перечислить в этой функции.
//
// Возвращаемое значение:
//  Массив       - массив строк, например, "РегистрСведений.ВерсииОбъектов".
//
Функция ПолучитьИсключенияПоискаСсылок() Экспорт
	
	Массив = Новый Массив;
	
	Массив.Добавить("Документ.усДействиеПоПеремещениюКонтейнера");
	Массив.Добавить("Документ.усДействиеПоПеремещениюТовара");
	Массив.Добавить("Документ.усДействиеПоПересчету");
	Массив.Добавить("Документ.усСтрокаОжидаемойПриемки");
	Массив.Добавить("Документ.усСтрокаПредварительнойПриемки");
	Массив.Добавить("Документ.усСтрокаПриемки");
	Массив.Добавить("Документ.усСтрокаЗаказаНаОтгрузку");
	Массив.Добавить("Документ.усВводПоложенияФиксированногоКонтейнера");
	Массив.Добавить("РегистрСведений.усЗаписанныеДокументы");
	
	Возврат Массив;
	
КонецФункции 

// Возвращает соответствие имен параметров сеанса и обработчиков для их инициализации.
//
Функция ОбработчикиИнициализацииПараметровСеанса() Экспорт
	
	// Для задания обработчиков параметров сеанса следует использовать шаблон:
	// Обработчики.Вставить("<ИмяПараметраСеанса>|<НачалоИмениПараметраСеанса*>", "Обработчик");
	//
	// Примечание. Символ '*'используется в конце имени параметра сеанса и обозначает,
	//             что один обработчик будет вызван для инициализации всех параметров сеанса
	//             с именем, начинающимся на слово НачалоИмениПараметраСеанса
	//
	
	Обработчики = Новый Соответствие;
	
	Обработчики.Вставить("РабочееМестоКлиента", "МенеджерОборудованияСервер.УстановитьПараметрыСеансаПодключаемогоОборудования");
	
	Возврат Обработчики;
	
КонецФункции

// Устанавливает текстовое описание предмета
//
// Параметры
//  СсылкаНаПредмет  – ЛюбаяСсылка – объект ссылочного типа.
//  Представление	 - Строка - сюда необходимо поместить текстовое описание.
Процедура УстановитьПредставлениеПредмета(СсылкаНаПредмет, Представление) Экспорт
	
КонецПроцедуры
