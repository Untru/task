/////////////////////////////////////////////////////////////////////////////////
// БазоваяФункциональность
//

// Возвращает список процедур-обработчиков обновления библиотеки.
//
// Здесь в алфавитном порядке размещаются только процедуры-обработчики обновления 
// библиотечных подсистем, которые используются в данной конфигурации. 
// Процедуры-обработчики обновления самой конфигурации следует размещать в функции 
// ОбработчикиОбновления общего модуля ОбновлениеИнформационнойБазыПереопределяемый.
//
// Возвращаемое значение:
//   ТаблицаЗначений - описание полей структуры см. в функции
//               ОбновлениеИнформационнойБазы.НоваяТаблицаОбработчиковОбновления() 
//
Функция ОбработчикиОбновленияСтандартныхПодсистем() Экспорт
	
	Обработчики = ОбновлениеИнформационнойБазы.НоваяТаблицаОбработчиковОбновления();
	
	// Подключаются процедуры-обработчики обновления библиотеки
	
	// АдресныйКлассификатор
	АдресныйКлассификатор.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец АдресныйКлассификатор
	
	// БазоваяФункциональность
	СтандартныеПодсистемыСервер.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец БазоваяФункциональность
	
	// БизнесПроцессыИЗадачи
	БизнесПроцессыИЗадачиСервер.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец БизнесПроцессыИЗадачи
	
	// ВариантыОтчетов
	ВариантыОтчетов.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ВариантыОтчетов
	
	// Взаимодействия
	Взаимодействия.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец Взаимодействия
	
	// Валюты
	РаботаСКурсамиВалют.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец Валюты
	
	// ДатыЗапретаИзменения
	ДатыЗапретаИзменения.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ДатыЗапретаИзменения
	
	// ДополнительныеОтчетыИОбработки
	ДополнительныеОтчетыИОбработки.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ДополнительныеОтчетыИОбработки
	
	// КалендарныеГрафики
	КалендарныеГрафики.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец КалендарныеГрафики
	
	// КонтактнаяИнформация
	УправлениеКонтактнойИнформацией.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец КонтактнаяИнформация
	
	// ОбменДанными
	ОбменДаннымиСервер.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ОбменДанными
	
	// ОбновлениеКонфигурации
	ОбновлениеКонфигурации.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ОбновлениеКонфигурации
	
	// ПолнотекстовыйПоиск
	ПолнотекстовыйПоискСервер.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ПолнотекстовыйПоиск
	
	// ПолучениеФайловИзИнтернета
	ПолучениеФайловИзИнтернета.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ПолучениеФайловИзИнтернета
	
	// Пользователи
	Пользователи.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец Пользователи
	
	// РаботаСПочтовымиСообщениями
	ЭлектроннаяПочта.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец РаботаСПочтовымиСообщениями
	
	// РаботаСФайлами
	РаботаСФайламиВызовСервера.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец РаботаСФайлами
	
	// РегламентныеЗадания
	РегламентныеЗаданияСервер.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец РегламентныеЗадания
	
	// Свойства
	УправлениеСвойствами.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец Свойства
	
	// УправлениеДоступом
	УправлениеДоступом.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец УправлениеДоступом
	
	// ФизическиеЛица
	ФизическиеЛица.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ФизическиеЛица
	
	// ЭлектроннаяЦифроваяПодпись
	ЭлектроннаяЦифроваяПодпись.ЗарегистрироватьОбработчикиОбновления(Обработчики);
	// Конец ЭлектроннаяЦифроваяПодпись
	
	Возврат Обработчики;
	
КонецФункции

// Возвращает признак, является ли конфигурация базовой.
//
// Пример реализации:
//  Если конфигурации выпускаются парами, то в имени базовой версии
//  может включаться дополнительное слово "Базовая". Тогда логика
//  определения базовой версии выглядит таким образом:
//
//	Возврат Найти(ВРег(Метаданные.Имя), "БАЗОВАЯ") > 0;
//
// Возвращаемое значение:
//   Булево   - Истина, если конфигурация - базовая.
//
Функция ЭтоБазоваяВерсияКонфигурации() Экспорт

	Возврат Найти(ВРег(Метаданные.Имя), "БАЗОВАЯ") > 0;

КонецФункции

// Возвращает соответствие имен параметров сеанса и обработчиков для их инициализации.
//
Функция ОбработчикиИнициализацииПараметровСеансаСтандартныхПодсистем() Экспорт
	
	// Для задания обработчиков параметров сеанса следует использовать шаблон:
	// Обработчики.Вставить("<ИмяПараметраСеанса>|<НачалоИмениПараметраСеанса*>", "Обработчик");
	//
	// Примечание. Символ '*'используется в конце имени параметра сеанса и обозначает,
	//             что один обработчик будет вызван для инициализации всех параметров сеанса
	//             с именем, начинающимся на слово НачалоИмениПараметраСеанса
	//
	
	Обработчики = Новый Соответствие;
	
	// ОбменДанными
	Обработчики.Вставить("ДатаОбновленияПовторноИспользуемыхЗначенийМРО", "ОбменДаннымиСервер.УстановкаПараметровСеанса");
	Обработчики.Вставить("ОбменДаннымиВключен",                           "ОбменДаннымиСервер.УстановкаПараметровСеанса");
	Обработчики.Вставить("ИспользуемыеПланыОбмена",                       "ОбменДаннымиСервер.УстановкаПараметровСеанса");
	Обработчики.Вставить("ПравилаВыборочнойРегистрацииОбъектов",          "ОбменДаннымиСервер.УстановкаПараметровСеанса");
	Обработчики.Вставить("ПравилаРегистрацииОбъектов",                    "ОбменДаннымиСервер.УстановкаПараметровСеанса");
	// Конец ОбменДанными
	
	// УправлениеДоступом
	Обработчики.Вставить("ОграничиватьДоступПоВиду*",               "УправлениеДоступом.УстановкаПараметровСеанса");
	Обработчики.Вставить("ВидыДоступа*",                            "УправлениеДоступом.УстановкаПараметровСеанса");
	Обработчики.Вставить("ДобавлятьРуководителямДоступПодчиненных", "УправлениеДоступом.УстановкаПараметровСеанса");
	// Конец УправлениеДоступом
	
	// Пользователи
	Обработчики.Вставить("ТекущийПользователь",        "Пользователи.УстановкаПараметровСеанса");
	Обработчики.Вставить("ТекущийВнешнийПользователь", "Пользователи.УстановкаПараметровСеанса");
	// Конец Пользователи
	
	// ОценкаПроизводительности
	Обработчики.Вставить("ТекущийЗамерВремени", "ОценкаПроизводительностиВызовСервера.УстановкаПараметровСеанса");
	// Конец ОценкаПроизводительности
	
	Возврат Обработчики;
	
КонецФункции

// Возвращает список имен объектов метаданных, данные которых могут содержать ссылки на различные объекты метаданных,
// но при этом эти ссылки не должны учитываться в бизнес-логике приложения.
//
// Возвращаемое значение:
//  Массив       - массив строк, например, "РегистрСведений.ВерсииОбъектов".
//
Функция ИсключенияПоискаСсылок() Экспорт
	
	Массив = Новый Массив;
	
	// Валюты
	Массив.Добавить(Метаданные.РегистрыСведений.КурсыВалют.ПолноеИмя());
	// Конец Валюты
	
	// ВерсионированиеОбъектов
	Массив.Добавить(Метаданные.РегистрыСведений.ВерсииОбъектов.ПолноеИмя());
	// Конец ВерсионированиеОбъектов
	
	// ВнешниеБизнесПроцессыИЗадачи
	Массив.Добавить(Метаданные.РегистрыСведений.ИсточникиВнешнихЗадач.ПолноеИмя());
	// Конец ВнешниеБизнесПроцессыИЗадачи
	
	// Свойства
	Массив.Добавить(Метаданные.РегистрыСведений.ДополнительныеСведения.ПолноеИмя());
	// Конец Свойства
	
	// УправлениеДоступом
	Массив.Добавить(Метаданные.РегистрыСведений.ГруппыЗначенийДоступа.ПолноеИмя());
	Массив.Добавить(Метаданные.РегистрыСведений.НаборыЗначенийДоступа.ПолноеИмя());
	Массив.Добавить(Метаданные.РегистрыСведений.ЗначенияГруппДоступа.ПолноеИмя());
	Массив.Добавить(Метаданные.РегистрыСведений.ТаблицыГруппДоступа.ПолноеИмя());
	Массив.Добавить(Метаданные.РегистрыСведений.ПраваПоЗначениямДоступа.ПолноеИмя());
	// Конец УправлениеДоступом
	
	// БизнесПроцессыИЗадачи
	Массив.Добавить(Метаданные.РегистрыСведений.ИсполнителиЗадач.ПолноеИмя());
	Массив.Добавить(Метаданные.РегистрыСведений.ДанныеБизнесПроцессов.ПолноеИмя());
	// Конец БизнесПроцессыИЗадачи
	
	// ФизическиеЛица
	Массив.Добавить(Метаданные.РегистрыСведений.ДокументыФизическихЛиц.ПолноеИмя());
	// Конец ФизическиеЛица
	
	// ПрисоединенныеФайлы
	Массив.Добавить(Метаданные.РегистрыСведений.НаличиеПрисоединенныхФайлов.ПолноеИмя());
	// Конец ПрисоединенныеФайлы
	
	// РаботаСФайлами
	Массив.Добавить(Метаданные.РегистрыСведений.ФайлыВРабочемКаталоге.ПолноеИмя());
	// Конец РаботаСФайлами
	
	Возврат Массив;
	
КонецФункции

// Устанавливает текстовое описание предмета
//
// Параметры
//  СсылкаНаПредмет  – ЛюбаяСсылка – объект ссылочного типа.
//  Представление	 - Строка - сюда необходимо поместить текстовое описание.
Процедура УстановитьПредставлениеПредмета(СсылкаНаПредмет, Представление) Экспорт
	
	// БизнесПроцессыИЗадачи
	Если ТипЗнч(СсылкаНаПредмет) = Тип("ЗадачаСсылка.ЗадачаИсполнителя") Тогда
		ПредставлениеОбъекта = СсылкаНаПредмет.Метаданные().ПредставлениеОбъекта;
		Если ПустаяСтрока(ПредставлениеОбъекта) Тогда
			ПредставлениеОбъекта = СсылкаНаПредмет.Метаданные().Представление();
		КонецЕсли;
		Представление = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			"%1 (%2)", СсылкаНаПредмет.Наименование, ПредставлениеОбъекта);
	КонецЕсли;
	// Конец БизнесПроцессыИЗадачи
	
	// Взаимодействия
	Если ТипЗнч(СсылкаНаПредмет) = Тип("ДокументСсылка.ЭлектронноеПисьмоВходящее") ИЛИ
		ТипЗнч(СсылкаНаПредмет) = Тип("ДокументСсылка.ЭлектронноеПисьмоИсходящее") ИЛИ
		ТипЗнч(СсылкаНаПредмет) = Тип("ДокументСсылка.ТелефонныйЗвонок") ИЛИ 
		ТипЗнч(СсылкаНаПредмет) = Тип("ДокументСсылка.Встреча") ИЛИ 
		ТипЗнч(СсылкаНаПредмет) = Тип("ДокументСсылка.ЗапланированноеВзаимодействие") Тогда
		
		ПредставлениеОбъекта = СсылкаНаПредмет.Метаданные().ПредставлениеОбъекта;
		Если ПустаяСтрока(ПредставлениеОбъекта) Тогда
			ПредставлениеОбъекта = СсылкаНаПредмет.Метаданные().Представление();
		КонецЕсли;
		Представление = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			"%1 (%2)", СсылкаНаПредмет.Тема, ПредставлениеОбъекта);
		
	КонецЕсли;
	// Конец Взаимодействия
	
КонецПроцедуры

// Переопределяет массив реквизитов объекта, относительно которых разрешается устанавливать время напоминания.
// Например, можно скрыть те реквизиты с датами, которые являются служебными или не имеют смысла для 
// установки напоминаний: дата документа или задачи и прочие.
// 
// Параметры
//  Источник	 - Любая ссылка - Ссылка на объект, для которого формируется массив реквизитов с датами
//  МассивРеквизитов - Массив - Массив имён реквизитов (из метаданных), содержащих даты
//
Процедура ПриЗаполненииСпискаРеквизитовИсточникаСДатамиДляНапоминания(Источник, МассивРеквизитов) Экспорт
	
	// БизнесПроцессыИЗадачи
	Если ТипЗнч(Источник) = Тип("ЗадачаСсылка.ЗадачаИсполнителя") Тогда
		МассивРеквизитов.Очистить();
		МассивРеквизитов.Добавить("СрокИсполнения"); 
		МассивРеквизитов.Добавить("ДатаНачала"); 
	КонецЕсли;
	// Конец БизнесПроцессыИЗадачи
		
	// ЗаметкиПользователя
	Если ТипЗнч(Источник) = Тип("СправочникСсылка.Заметки") Тогда
		МассивРеквизитов.Очистить();
	КонецЕсли;
	// Конец ЗаметкиПользователя
	
КонецПроцедуры

