// Разбивает строку на несколько строк по разделителю. Разделитель может иметь любую длину.
//
// Параметры:
//  Строка                 - Строка - текст с разделителями;
//  Разделитель            - Строка - разделитель строк текста, минимум 1 символ;
//  ПропускатьПустыеСтроки - Булево - признак необходимости включения в результат пустых строк.
//    Если параметр не задан, то функция работает в режиме совместимости со своей предыдущей версией:
//     - для разделителя-пробела пустые строки не включаются в результат, для остальных разделителей пустые строки
//       включаются в результат.
//     - если параметр Строка не содержит значащих символов или не содержит ни одного символа (пустая строка), то в
//       случае разделителя-пробела результатом функции будет массив, содержащий одно значение "" (пустая строка), а
//       при других разделителях результатом функции будет пустой массив.
//  СокращатьНепечатаемыеСимволы - Булево - сокращать непечатаемые символы по краям каждой из найденных подстрок.
//
// Возвращаемое значение:
//  Массив - массив строк.
//
// Примеры:
//  РазложитьСтрокуВМассивПодстрок(",один,,два,", ",") - возвратит массив из 5 элементов, три из которых  - пустые строки;
//  РазложитьСтрокуВМассивПодстрок(",один,,два,", ",", Истина) - возвратит массив из двух элементов;
//  РазложитьСтрокуВМассивПодстрок(" один   два  ", " ") - возвратит массив из двух элементов;
//  РазложитьСтрокуВМассивПодстрок("") - возвратит пустой массив;
//  РазложитьСтрокуВМассивПодстрок("",,Ложь) - возвратит массив с одним элементом "" (пустой строкой);
//  РазложитьСтрокуВМассивПодстрок("", " ") - возвратит массив с одним элементом "" (пустой строкой);
//
Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено, СокращатьНепечатаемыеСимволы = Ложь) Экспорт
	
	Результат = Новый Массив;
	
	// для обеспечения обратной совместимости
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда 
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;
	//
	
	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Если СокращатьНепечатаемыеСимволы Тогда
				Результат.Добавить(СокрЛП(Подстрока));
			Иначе
				Результат.Добавить(Подстрока);
			КонецЕсли;
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;
	
	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Если СокращатьНепечатаемыеСимволы Тогда
			Результат.Добавить(СокрЛП(Строка));
		Иначе
			Результат.Добавить(Строка);
		КонецЕсли;
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции 

// Подставляет параметры в строку. Максимально возможное число параметров - 9.
// Параметры в строке задаются как %<номер параметра>. Нумерация параметров начинается с единицы.
//
// Параметры:
//  СтрокаПодстановки  - Строка - шаблон строки с параметрами (вхождениями вида "%ИмяПараметра");
//  Параметр<n>        - Строка - подставляемый параметр.
//
// Возвращаемое значение:
//  Строка   - текстовая строка с подставленными параметрами.
//
// Пример:
//  ПодставитьПараметрыВСтроку(НСтр("ru='%1 пошел в %2'"), "Вася", "Зоопарк") = "Вася пошел в Зоопарк".
//
Функция ПодставитьПараметрыВСтроку(Знач СтрокаПодстановки,
	Знач Параметр1, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
	Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
	Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт
	
	ИспользоватьАльтернативныйАлгоритм = 
		Найти(Параметр1, "%")
		Или Найти(Параметр2, "%")
		Или Найти(Параметр3, "%")
		Или Найти(Параметр4, "%")
		Или Найти(Параметр5, "%")
		Или Найти(Параметр6, "%")
		Или Найти(Параметр7, "%")
		Или Найти(Параметр8, "%")
		Или Найти(Параметр9, "%");
		
	Если ИспользоватьАльтернативныйАлгоритм Тогда
		СтрокаПодстановки = ПодставитьПараметрыВСтрокуАльтернативныйАлгоритм(СтрокаПодстановки, Параметр1,
			Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);
	Иначе
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%1", Параметр1);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%2", Параметр2);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%3", Параметр3);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%4", Параметр4);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%5", Параметр5);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%6", Параметр6);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%7", Параметр7);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%8", Параметр8);
		СтрокаПодстановки = СтрЗаменить(СтрокаПодстановки, "%9", Параметр9);
	КонецЕсли;
	
	Возврат СтрокаПодстановки;
КонецФункции

// Вставляет параметры в строку, учитывая, что в параметрах могут использоваться подстановочные слова %1, %2 и т.д.
Функция ПодставитьПараметрыВСтрокуАльтернативныйАлгоритм(Знач СтрокаПодстановки,
	Знач Параметр1, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
	Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
	Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено)
	
	Результат = "";
	Позиция = Найти(СтрокаПодстановки, "%");
	Пока Позиция > 0 Цикл 
		Результат = Результат + Лев(СтрокаПодстановки, Позиция - 1);
		СимволПослеПроцента = Сред(СтрокаПодстановки, Позиция + 1, 1);
		ПодставляемыйПараметр = "";
		Если СимволПослеПроцента = "1" Тогда
			ПодставляемыйПараметр =  Параметр1;
		ИначеЕсли СимволПослеПроцента = "2" Тогда
			ПодставляемыйПараметр =  Параметр2;
		ИначеЕсли СимволПослеПроцента = "3" Тогда
			ПодставляемыйПараметр =  Параметр3;
		ИначеЕсли СимволПослеПроцента = "4" Тогда
			ПодставляемыйПараметр =  Параметр4;
		ИначеЕсли СимволПослеПроцента = "5" Тогда
			ПодставляемыйПараметр =  Параметр5;
		ИначеЕсли СимволПослеПроцента = "6" Тогда
			ПодставляемыйПараметр =  Параметр6;
		ИначеЕсли СимволПослеПроцента = "7" Тогда
			ПодставляемыйПараметр =  Параметр7
		ИначеЕсли СимволПослеПроцента = "8" Тогда
			ПодставляемыйПараметр =  Параметр8;
		ИначеЕсли СимволПослеПроцента = "9" Тогда
			ПодставляемыйПараметр =  Параметр9;
		КонецЕсли;
		Если ПодставляемыйПараметр = "" Тогда
			Результат = Результат + "%";
			СтрокаПодстановки = Сред(СтрокаПодстановки, Позиция + 1);
		Иначе
			Результат = Результат + ПодставляемыйПараметр;
			СтрокаПодстановки = Сред(СтрокаПодстановки, Позиция + 2);
		КонецЕсли;
		Позиция = Найти(СтрокаПодстановки, "%");
	КонецЦикла;
	Результат = Результат + СтрокаПодстановки;
	
	Возврат Результат;
КонецФункции

Функция ЕстьСимволыВНачалеВКонце(Строка, ПроверяемыеСимволы) Экспорт
	Для Позиция = 1 По СтрДлина(ПроверяемыеСимволы) Цикл
		Символ = Сред(ПроверяемыеСимволы, Позиция, 1);
		СимволНайден = (Лев(Строка,1) = Символ) Или (Прав(Строка,1) = Символ);
		Если СимволНайден Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;
	Возврат Ложь;
КонецФункции

Функция СтрокаСодержитТолькоДопустимыеСимволы(Строка, ДопустимыеСимволы) Экспорт
	МассивСимволов = Новый Массив;
	Для Позиция = 1 По СтрДлина(ДопустимыеСимволы) Цикл
		МассивСимволов.Добавить(Сред(ДопустимыеСимволы,Позиция,1));
	КонецЦикла;
	
	Для Позиция = 1 По СтрДлина(Строка) Цикл
		Если МассивСимволов.Найти(Сред(Строка, Позиция, 1)) = Неопределено Тогда
			Возврат Ложь;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;
КонецФункции

Функция ПропуститьПробелы(Знач Строка,
                          Знач ТекущийИндекс,
                          Знач ПропускаемыйСимвол) Экспорт
		
	
	Результат = ТекущийИндекс;
	
	// убираем лишние пробелы если они есть
	Пока ТекущийИндекс < СтрДлина(Строка) Цикл
		Если Сред(Строка, ТекущийИндекс, 1) <> ПропускаемыйСимвол Тогда
			Возврат ТекущийИндекс;
		КонецЕсли;
		ТекущийИндекс = ТекущийИндекс + 1;
	КонецЦикла;
	
	Возврат ТекущийИндекс;
	
КонецФункции

// Возвращает структуру, содержащую значения реквизитов прочитанные из информационной базы
// по ссылке на объект.
// 
//  Если доступа к одному из реквизитов нет, возникнет исключение прав доступа.
//  Если необходимо зачитать реквизит независимо от прав текущего пользователя,
//  то следует использовать предварительный переход в привилегированный режим.
// 
// Функция не предназначена для получения значений реквизитов пустых ссылок.
//
// Параметры:
//  Ссылка    - ЛюбаяСсылка - объект, значения реквизитов которого необходимо получить.
//
//  Реквизиты - Строка - имена реквизитов, перечисленные через запятую, в формате
//              требований к свойствам структуры.
//              Например, "Код, Наименование, Родитель".
//            - Структура, ФиксированнаяСтруктура - в качестве ключа передается
//              псевдоним поля для возвращаемой структуры с результатом, а в качестве
//              значения (опционально) фактическое имя поля в таблице.
//              Если значение не определено, то имя поля берется из ключа.
//            - Массив, ФиксированныйМассив - имена реквизитов в формате требований
//              к свойствам структуры.
//
// Возвращаемое значение:
//  Структура - содержит имена (ключи) и значения затребованных реквизитов.
//              Если строка затребованных реквизитов пуста, то возвращается пустая структура.
//              Если в качестве объекта передана пустая ссылка, то все реквизиты вернутся со значением Неопределено.
//
&НаСервере 
Функция ЗначенияРеквизитовОбъекта(Ссылка, Знач Реквизиты) Экспорт
	
	Если ТипЗнч(Реквизиты) = Тип("Строка") Тогда
		Если ПустаяСтрока(Реквизиты) Тогда
			Возврат Новый Структура;
		КонецЕсли;
		Реквизиты = РазложитьСтрокуВМассивПодстрок(Реквизиты, ",", Истина);
	КонецЕсли;
	
	СтруктураРеквизитов = Новый Структура;
	Если ТипЗнч(Реквизиты) = Тип("Структура") Или ТипЗнч(Реквизиты) = Тип("ФиксированнаяСтруктура") Тогда
		СтруктураРеквизитов = Реквизиты;
	ИначеЕсли ТипЗнч(Реквизиты) = Тип("Массив") Или ТипЗнч(Реквизиты) = Тип("ФиксированныйМассив") Тогда
		Для Каждого Реквизит Из Реквизиты Цикл
			СтруктураРеквизитов.Вставить(СтрЗаменить(Реквизит, ".", ""), Реквизит);
		КонецЦикла;
	Иначе
		ВызватьИсключение ПодставитьПараметрыВСтроку(
			НСтр("ru = 'Неверный тип второго параметра Реквизиты: %1'"),
			Строка(ТипЗнч(Реквизиты)));
	КонецЕсли;
	
	ТекстПолей = "";
	Для Каждого КлючИЗначение Из СтруктураРеквизитов Цикл
		ИмяПоля   = ?(ЗначениеЗаполнено(КлючИЗначение.Значение),
		              СокрЛП(КлючИЗначение.Значение),
		              СокрЛП(КлючИЗначение.Ключ));
		
		Псевдоним = СокрЛП(КлючИЗначение.Ключ);
		
		ТекстПолей  = ТекстПолей + ?(ПустаяСтрока(ТекстПолей), "", ",") + "
		|	" + ИмяПоля + " КАК " + Псевдоним;
	КонецЦикла;
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	Запрос.Текст =
	"ВЫБРАТЬ
	|" + ТекстПолей + "
	|ИЗ
	|	" + Ссылка.Метаданные().ПолноеИмя() + " КАК ПсевдонимЗаданнойТаблицы
	|ГДЕ
	|	ПсевдонимЗаданнойТаблицы.Ссылка = &Ссылка
	|";
	Выборка = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Результат = Новый Структура;
	Для Каждого КлючИЗначение Из СтруктураРеквизитов Цикл
		Результат.Вставить(КлючИЗначение.Ключ);
	КонецЦикла;
	ЗаполнитьЗначенияСвойств(Результат, Выборка);
	
	Возврат Результат;
	
КонецФункции

//Возвращает значение реквизита, прочитанного из информационной базы по ссылке на объект.
// 
//  Если доступа к реквизиту нет, возникнет исключение прав доступа.
//  Если необходимо зачитать реквизит независимо от прав текущего пользователя,
//  то следует использовать предварительный переход в привилегированный режим.
//
// Функция не предназначена для получения значений реквизитов пустых ссылок.
// 
// Параметры:
//  Ссылка       - ссылка на объект, - элемент справочника, документ, ...
//  ИмяРеквизита - Строка, например, "Код".
// 
// Возвращаемое значение:
//  Произвольный    - зависит от типа значения прочитанного реквизита.
//
&НаСервере
Функция ЗначениеРеквизитаОбъекта(Ссылка, ИмяРеквизита) Экспорт
	
	Результат = ЗначенияРеквизитовОбъекта(Ссылка, ИмяРеквизита);
	Возврат Результат[СтрЗаменить(ИмяРеквизита, ".", "")];
	
КонецФункции

// Заменяет недопустимые символы в XML-строке на заданные символы
//
// Параметры:
//   Текст - Строка - строка, в которой требуется выполнить замену недопустимых символов.
//   СимволЗамены - Строка - строка, на которую требуется выполнить замену недопустимого символа в XML-строке
// 
//  Возвращаемое значение:
//    Строка - строка, полученная заменой недопустимых символов в XML-строке.
//
Функция ЗаменитьНедопустимыеСимволыXML(Знач Текст, СимволЗамены = " ") Экспорт
	
#Если НЕ ВебКлиент Тогда
	ПозицияНачала = 1;
	Пока Истина Цикл
		Позиция = НайтиНедопустимыеСимволыXML(Текст, ПозицияНачала);
		Если Позиция = 0 Тогда
			Прервать;
		КонецЕсли;
		Если Позиция > 1 Тогда
			НедопустимыйСимвол = Сред(Текст, Позиция - 1, 1);
			Если НайтиНедопустимыеСимволыXML(НедопустимыйСимвол) > 0 Тогда
				Текст = СтрЗаменить(Текст, НедопустимыйСимвол, СимволЗамены);
			КонецЕсли;
		КонецЕсли;
		НедопустимыйСимвол = Сред(Текст, Позиция, 1);
		Если НайтиНедопустимыеСимволыXML(НедопустимыйСимвол) > 0 Тогда
			Текст = СтрЗаменить(Текст, НедопустимыйСимвол, СимволЗамены);
		КонецЕсли;
		ПозицияНачала = Позиция + 1;
	КонецЦикла;
#КонецЕсли

	Возврат Текст;
КонецФункции

// Удаляет недопустимые символы в XML-строке.
//
// Параметры:
//  Текст - Строка - строка, в которой требуется удалить недопустимые символы.
// 
// Возвращаемое значение:
//  Строка - Строка, полученная при удалении недопустимых символов в XML-строке.
//
Функция УдалитьНедопустимыеСимволыXML(Знач Текст) Экспорт
	
	Возврат ЗаменитьНедопустимыеСимволыXML(Текст, "");
	
КонецФункции

// Формирует и выводит сообщение, которое может быть связано с элементом 
// управления формы.
//
//  Параметры
//  ТекстСообщенияПользователю - Строка - текст сообщения.
//  КлючДанных                 - ЛюбаяСсылка - на объект информационной базы.
//                               Ссылка на объект информационной базы, к которому это сообщение относится,
//                               или ключ записи.
//  Поле                       - Строка - наименование реквизита формы
//  ПутьКДанным                - Строка - путь к данным (путь к реквизиту формы)
//  Отказ                      - Булево - Выходной параметр
//                               Всегда устанавливается в значение Истина
//
//	Примеры использования:
//
//	1. Для вывода сообщения у поля управляемой формы, связанного с реквизитом объекта:
//	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//		НСтр("ru = 'Сообщение об ошибке.'"), ,
//		"ПолеВРеквизитеФормыОбъект",
//		"Объект");
//
//	Альтернативный вариант использования в форме объекта:
//	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//		НСтр("ru = 'Сообщение об ошибке.'"), ,
//		"Объект.ПолеВРеквизитеФормыОбъект");
//
//	2. Для вывода сообщения рядом с полем управляемой формы, связанным с реквизитом формы:
//	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//		НСтр("ru = 'Сообщение об ошибке.'"), ,
//		"ИмяРеквизитаФормы");
//
//	3. Для вывода сообщения связанного с объектом информационной базы
//	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//		НСтр("ru = 'Сообщение об ошибке.'"), ОбъектИнформационнойБазы, "Ответственный",,Отказ);
//
// 4. Для вывода сообщения по ссылке на объект информационной базы
//	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//		НСтр("ru = 'Сообщение об ошибке.'"), Ссылка, , , Отказ);
//
// Случаи некорректного использования:
//  1. Передача одновременно параметров КлючДанных и ПутьКДанным
//  2. Передача в параметре КлючДанных значения типа отличного от допустимых
//  3. Установка ссылки без установки поля (и/или пути к данным)
//
Процедура СообщитьПользователю(
		Знач ТекстСообщенияПользователю,
		Знач КлючДанных = Неопределено,
		Знач Поле = "",
		Знач ПутьКДанным = "",
		Отказ = Ложь) Экспорт
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = ТекстСообщенияПользователю;
	Сообщение.Поле = Поле;
	
	ЭтоОбъект = Ложь;
	
#Если НЕ ТонкийКлиент И НЕ ВебКлиент Тогда
	Если КлючДанных <> Неопределено
	   И XMLТипЗнч(КлючДанных) <> Неопределено Тогда
		ТипЗначенияСтрокой = XMLТипЗнч(КлючДанных).ИмяТипа;
		ЭтоОбъект = Найти(ТипЗначенияСтрокой, "Object.") > 0;
	КонецЕсли;
#КонецЕсли
	
	Если ЭтоОбъект Тогда
		Сообщение.УстановитьДанные(КлючДанных);
	Иначе
		Сообщение.КлючДанных = КлючДанных;
	КонецЕсли;
	
	Если НЕ ПустаяСтрока(ПутьКДанным) Тогда
		Сообщение.ПутьКДанным = ПутьКДанным;
	КонецЕсли;
		
	Сообщение.Сообщить();
	
	Отказ = Истина;
	
КонецПроцедуры


