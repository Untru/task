/////////////////////////////////////////////////////////////////////////////////
// БазоваяФункциональность
//

// Вызывается при завершении работы системы, чтобы запросить список предупреждений,
// выводимых пользователю пользователю.
//
// Параметры:
//	Предупреждения - Массив - список предупреждений. Элемент массива - Структура с полями:
//		ТекстФлажка - Строка - текст флажка.
//		ПоясняющийТекст - Строка - текст, выводимый в форме сверху управляющего элемента (флажок или гиперссылка).
//		ДействиеПриУстановленномФлажке - Структура с полями:
//			Форма - путь к открываемой форме.
//			ПараметрыФормы - произвольная структура параметров формы Форма. 
//		ТекстГиперссылки - Строка - текст гипперссылки.
//		ДействиеПриНажатииГипперссылки - Структура с полями:
//			Форма - Строка - путь к форме, которая должна открываться по нажатию на гиперссылку.
//			ПараметрыФормы - Структура - произвольная структура параметров для вышеописанной формы.
//			ПрикладнаяФормаПредупреждения - Строка - путь к форме, которая должна открываться сразу вместо 
//				универсальной формы в случае, когда в списке предупреждений оказывется только одно данное предупреждение.
//			ПараметрыПрикладнойФормыПредупреждения - Структура - произвольная структура параметров для вышеописанной формы.
//
Процедура ПолучитьСписокПредупреждений(Предупреждения) Экспорт
	
	// РезервноеКопирование
	РезервноеКопированиеИБКлиент.ПриЗавершенииРаботыСистемы(Предупреждения);	
	// Конец РезервноеКопирование
	
	// РаботаСФайлами
	РаботаСФайламиКлиент.ПриЗавершенииРаботыСистемы(Предупреждения);
	// Конец РаботаСФайлами
   
КонецПроцедуры

// Вызывается при необходимости открыть форму списка активных пользователей,
// которые в данный момент времени работают с системой.
//
// Пример реализации:
// - при внедрении подсистемы "Завершение работы пользователей" можно использовать форму обработки АктивныеПользователи:
//   ОткрытьФорму("Обработка.АктивныеПользователи.Форма.ФормаСпискаАктивныхПользователей");
//
Процедура ОткрытьСписокАктивныхПользователей() Экспорт
	
	// ЗавершениеРаботыПользователей
	ОткрытьФорму("Обработка.АктивныеПользователи.Форма.ФормаСпискаАктивныхПользователей");
	// Конец ЗавершениеРаботыПользователей
	
КонецПроцедуры

// Вызывается при необходимости определить минимально необходимую версию платформы для запуска.
//
//
// Параметры: ПараметрыПроверки - ФиксированнаяСтруктура - список полей совпадает со списком параметров 
//															функции СтандартныеПодсистемыКлиент.ПроверитьВерсиюПлатформы().			
//							
Процедура ПолучитьМинимальноНеобходимуюВерсиюПлатформы(ПараметрыПроверки) Экспорт
	
	ПараметрыПроверки = Новый ФиксированнаяСтруктура("ВерсияПлатформы, РаботаВПрограммеЗапрещена", "8.2.14.519", Истина);
	СтандартныеПодсистемыКлиент.ПроверитьВерсиюПлатформы(ПараметрыПроверки.ВерсияПлатформы, ПараметрыПроверки.РаботаВПрограммеЗапрещена);
	ПараметрыПроверки = Новый ФиксированнаяСтруктура("ВерсияПлатформы, РаботаВПрограммеЗапрещена", "8.2.15.289", Ложь);
	
КонецПроцедуры	