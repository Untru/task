
&НаКлиенте
Процедура Далее(Команда)
	Если Элементы.Страницы.ТекущаяСтраница.Имя = "Организация" Тогда
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Отделы;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "Отделы" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.ФизЛица;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "ФизЛица" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Статусы;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "Статусы" Тогда
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Категории;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "Категории" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.НастройкиПользователей;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "НастройкиПользователей" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Константы;	
	КонецЕсли;		
КонецПроцедуры

&НаКлиенте
Процедура Назад(Команда)
	Если Элементы.Страницы.ТекущаяСтраница.Имя = "Константы" Тогда
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.НастройкиПользователей;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "НастройкиПользователей" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Категории;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "Категории" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Статусы;	
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "Статусы" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.ФизЛица;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "ФизЛица" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Отделы;
	ИначеЕсли Элементы.Страницы.ТекущаяСтраница.Имя = "Отделы" Тогда	
		Элементы.Страницы.ТекущаяСтраница = Элементы.Страницы.ПодчиненныеЭлементы.Организация;	
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ЭтаФорма.НаименованиеОрганизации = "Наша фирма";
	ЭтаФорма.ПолноеНаименованиеОрганизации = "ООО ""Наша фирма""";
	ЭтаФорма.ВремяУдаленияЗаписиОбИсполнителе = 5;
	ЭтаФорма.ВремяУдаленияЗаписиОСообщении = 5;
	ЭтаФорма.ВремяУдаленияЗаписиОСтатусе = 5;
	ЭтаФорма.ВремяУдаленияЗаписиОФайле = 5;
	
	// Заполним Контрагенты
	НоваяСтрока = ЭтаФорма.ТЗОтделы.Добавить();
	НоваяСтрока.Наименование = "Основной отдел";
	НоваяСтрока.ЯвляетсяИсполнителем = Истина;
	
	// Заполним физ лица
	НоваяСтрока = ЭтаФорма.ТЗФизЛица.Добавить();
	НоваяСтрока.Наименование = "Иванов И.И.";
	НоваяСтрока.ФИОПолностью = "Иванов Иван Иванович";

	// Заполним Статусы и настройки пользователей
	ПриОткрытииНаСервереЗаполнение();
	
КонецПроцедуры

&НаСервере
Процедура ПриОткрытииНаСервереЗаполнение()
	// Статус Новое
	НоваяСтрока = ЭтаФорма.ТЗСтатусы.Добавить();
	НоваяСтрока.Наименование = Справочники.Статусы.Новое.Наименование;
	// Статус Принято
	НоваяСтрока = ЭтаФорма.ТЗСтатусы.Добавить();
	НоваяСтрока.Наименование = "Принято";
	НоваяСтрока.ПроцентВыполнения = 5;
	НоваяСтрока.КоличествоЧасовВыполнения = 1;
	НоваяСтрока.ЦветСтрокиПриПревышении = Перечисления.ЦветаСтрок.Розовый; 
	// Статус В работе
	НоваяСтрока = ЭтаФорма.ТЗСтатусы.Добавить();
	НоваяСтрока.Наименование = "В работе";
	НоваяСтрока.ЦветСтроки = Перечисления.ЦветаСтрок.Голубой;
	НоваяСтрока.ПроцентВыполнения = 30;
	НоваяСтрока.КоличествоЧасовВыполнения = 5;
	НоваяСтрока.ЦветСтрокиПриПревышении = Перечисления.ЦветаСтрок.Лосось; 
	// Статус Завершение
	НоваяСтрока = ЭтаФорма.ТЗСтатусы.Добавить();
	НоваяСтрока.Наименование = "Завершение";
	НоваяСтрока.ЦветСтроки = Перечисления.ЦветаСтрок.Темнооранжевый;
	НоваяСтрока.ПроцентВыполнения = 80;
	НоваяСтрока.КоличествоЧасовВыполнения = 2;
	НоваяСтрока.ЦветСтрокиПриПревышении = Перечисления.ЦветаСтрок.Лосось; 
	// Статус Выполнено
	НоваяСтрока = ЭтаФорма.ТЗСтатусы.Добавить();
	НоваяСтрока.Наименование = Справочники.Статусы.Выполнено.Наименование;
	НоваяСтрока.ПроцентВыполнения = 95;
	НоваяСтрока.ЦветСтроки = Перечисления.ЦветаСтрок.Светлозеленый;
	// Статус Закрыто
	НоваяСтрока = ЭтаФорма.ТЗСтатусы.Добавить();
	НоваяСтрока.Наименование = Справочники.Статусы.Закрыто.Наименование;
	НоваяСтрока.ПроцентВыполнения = 100;
	НоваяСтрока.ЦветСтроки = Перечисления.ЦветаСтрок.Серебряный;
	
	// Настройка пользователя
	НоваяСтрока = ЭтаФорма.ТЗНастройкиПользователей.Добавить();
	НоваяСтрока.Наименование = Справочники.НастройкиПользователей.СтандартныеНастройки.Наименование;
	НоваяСтрока.АвтооткрытииФормыОбращений = Истина;
	НоваяСтрока.ТипПрименяемыхОбращений = Перечисления.ТипПрименяемыхОбращений.ВнутренниеИВнешниеОбращения;
	НоваяСтрока.ОбращениеПоУмолчанию = Перечисления.ВидОбращений.ВнутренниеОбращения;
	
	// Категории
	Дерево =  ЭтаФорма.ДЗКатегории.ПолучитьЭлементы();
	НоваяСтрокаУровень = Дерево.Добавить();
	НоваяСтрокаУровень.Наименование = "Интернет, телефония";
	НоваяСтрока = НоваяСтрокаУровень.ПолучитьЭлементы().Добавить();
	НоваяСтрока.Наименование = "Проблемы с интернетом";
	НоваяСтрока.ЗаголовокОбращения = "Не работает интернет";
		
КонецПроцедуры

&НаКлиенте
Процедура Готово(Команда)
	ГотовоНаСервере();
	ЭтаФорма.Закрыть();
КонецПроцедуры

&НаСервере
Процедура ЗаписатьСправочникКатегории(ЭлементыДЗ,РодительСК,Отдел)
    СправочникКатегории = Справочники.Категории;
	Для Каждого СтрокаДЗ Из ЭлементыДЗ Цикл
		НайденнаяКатегория = СправочникКатегории.НайтиПоНаименованию(СтрокаДЗ.Наименование);
		Если НЕ ЗначениеЗаполнено(НайденнаяКатегория) Тогда
			Если СтрокаДЗ.ПолучитьРодителя() = Неопределено Тогда
				НовыйЭлемент = СправочникКатегории.СоздатьГруппу();
				НовыйЭлемент.Наименование = СтрокаДЗ.Наименование;	
			Иначе	
				НовыйЭлемент = СправочникКатегории.СоздатьЭлемент();
				Если РодительСК.ЭтоГруппа Тогда
					НовыйЭлемент.Родитель =	РодительСК;
				КонецЕсли;
				НовыйЭлемент.Наименование = СтрокаДЗ.Наименование;
				НовыйЭлемент.Заголовок = СтрокаДЗ.ЗаголовокОбращения;
				НовыйЭлемент.Отдел = Отдел;
			КонецЕсли;	
			НовыйЭлемент.Записать();
			НайденнаяКатегория = НовыйЭлемент.Ссылка;
		КонецЕсли;	
		ЗаписатьСправочникКатегории(СтрокаДЗ.ПолучитьЭлементы(),НайденнаяКатегория,Отдел);
	КонецЦикла;

КонецПроцедуры

&НаСервере
Процедура ГотовоНаСервере()
	//Записываем настройки	
	// По организации
	СправочникОрганизации = Справочники.Организации;
	НайденнаяОрганизация = СправочникОрганизации.НайтиПоНаименованию(ЭтаФорма.НаименованиеОрганизации);
	Если НЕ ЗначениеЗаполнено(НайденнаяОрганизация) Тогда
		 НовыйЭлемент = СправочникОрганизации.СоздатьЭлемент();
		 НовыйЭлемент.Наименование = ЭтаФорма.НаименованиеОрганизации;
		 НовыйЭлемент.ПолноеНаименование = ЭтаФорма.ПолноеНаименованиеОрганизации;
		 НовыйЭлемент.ИНН = ЭтаФорма.ИННОрганизации;
		 НовыйЭлемент.КПП = ЭтаФорма.КППОрганизации;
		 НовыйЭлемент.Записать();
		 
		 НайденнаяОрганизация = НовыйЭлемент.Ссылка;
	КонецЕсли;	
	
	// По отделам
	СправочникОтделы = Справочники.Контрагенты;
	Для Каждого СтрокаТЗ Из ЭтаФорма.ТЗОтделы Цикл
		НайденныйОтдел = СправочникОтделы.НайтиПоНаименованию(СтрокаТЗ.Наименование);
		Если НЕ ЗначениеЗаполнено(НайденныйОтдел) Тогда
			НовыйЭлемент = СправочникОтделы.СоздатьЭлемент();
			//НовыйЭлемент.Владелец = НайденнаяОрганизация; //Князьков 2020-02-14 Наследие веков 
			НовыйЭлемент.Наименование = СтрокаТЗ.Наименование;
			НовыйЭлемент.ЯвляетсяИсполнителем = СтрокаТЗ.ЯвляетсяИсполнителем;
			НовыйЭлемент.Записать();
			
			//НайденныйОтдел =СправочникОтделы.ПустаяСсылка(); //НовыйЭлемент.Ссылка;
			НайденныйОтдел = НовыйЭлемент.Ссылка; //Князьков 2020-02-14 Умышленное вредительство?
		КонецЕсли;	
	КонецЦикла;
	
	// По Физ Лицам
	СправочникФизЛица = Справочники.ФизическиеЛица;
	Для Каждого СтрокаТЗ Из ЭтаФорма.ТЗФизЛица Цикл
		НайденноеФизЛицо = СправочникФизЛица.НайтиПоНаименованию(СтрокаТЗ.Наименование);
		Если НЕ ЗначениеЗаполнено(НайденноеФизЛицо) Тогда
			НовыйЭлемент = СправочникФизЛица.СоздатьЭлемент();
			НовыйЭлемент.Наименование = СтрокаТЗ.Наименование;
			НовыйЭлемент.ФИОПолностью = СтрокаТЗ.ФИОПолностью;
			НовыйЭлемент.Телефон = СтрокаТЗ.Телефон;
			НовыйЭлемент.Записать();
			
			НайденноеФизЛицо = НовыйЭлемент.Ссылка;
		КонецЕсли;	
	КонецЦикла;

	// Запишем Регистр Сотрудники Отделов
	ЗаписьРС = РегистрыСведений.СотрудникиОтделов.СоздатьНаборЗаписей();
	ЗаписьРС.Прочитать();
	НоваяСтрока = ЗаписьРС.Добавить();
	НоваяСтрока.Отдел = НайденныйОтдел;
	НоваяСтрока.Сотрудник = НайденноеФизЛицо;
	НоваяСтрока.ВидМестаРаботы = Перечисления.ВидМестаРаботы.ОсновноеМесто;
	НоваяСтрока.Ответственный = Истина;
	ЗаписьРС.Записать();

	 // По статусам
	СправочникСтатусы = Справочники.Статусы;
	Для Каждого СтрокаТЗ Из ЭтаФорма.ТЗСтатусы Цикл
		НайденныйСтатус = СправочникСтатусы.НайтиПоНаименованию(СтрокаТЗ.Наименование);
		Если НЕ ЗначениеЗаполнено(НайденныйСтатус) ИЛИ НайденныйСтатус.Предопределенный Тогда
			Если НЕ НайденныйСтатус.Предопределенный Тогда
				НовыйЭлемент = СправочникСтатусы.СоздатьЭлемент();
				НовыйЭлемент.Наименование = СтрокаТЗ.Наименование;
			Иначе
				НовыйЭлемент = НайденныйСтатус.ПолучитьОбъект();
			КонецЕсли;
			НовыйЭлемент.ЦветСтроки = СтрокаТЗ.ЦветСтроки;
			НовыйЭлемент.ПроцентВыполнения = СтрокаТЗ.ПроцентВыполнения;
			НовыйЭлемент.КоличествоЧасовВыполнения = СтрокаТЗ.КоличествоЧасовВыполнения;
			НовыйЭлемент.ЦветСтрокиПриПревышении = СтрокаТЗ.ЦветСтрокиПриПревышении;
			НовыйЭлемент.Записать();
		КонецЕсли;	
	КонецЦикла;
	
	// По категориям
	ЗаписатьСправочникКатегории(ЭтаФорма.ДЗКатегории.ПолучитьЭлементы(),Справочники.Категории.ПустаяСсылка(),НайденныйОтдел);
	
	
	//По настройкам пользователей
	СправочникНастрПользователей = Справочники.НастройкиПользователей;
	Для Каждого СтрокаТЗ Из ЭтаФорма.ТЗНастройкиПользователей Цикл
		НайденныеНП = СправочникНастрПользователей.НайтиПоНаименованию(СтрокаТЗ.Наименование);
		Если НЕ ЗначениеЗаполнено(НайденныеНП) ИЛИ НайденныеНП.Предопределенный Тогда
			Если НЕ НайденныеНП.Предопределенный Тогда
				НовыйЭлемент = СправочникНастрПользователей.СоздатьЭлемент();
				НовыйЭлемент.Наименование = СтрокаТЗ.Наименование;
			Иначе
			   НовыйЭлемент = НайденныеНП.ПолучитьОбъект();
			КонецЕсли;
			НовыйЭлемент.АвтоОткрытииРабочегоСтолаОбращений = СтрокаТЗ.АвтооткрытииФормыОбращений;
			НовыйЭлемент.ТипПрименяемыхОбращений = СтрокаТЗ.ТипПрименяемыхОбращений;
			НовыйЭлемент.ОбращенияПоУмолчанию = СтрокаТЗ.ОбращениеПоУмолчанию;
			НовыйЭлемент.Записать();
			
			НайденныеНП = НовыйЭлемент.Ссылка;
		КонецЕсли;	
	КонецЦикла;
	
	//Обновим запись текущего пользователя
	ТекПольз = ПараметрыСеанса.ТекущийПользователь;
	ОбъектТП = ТекПольз.ПолучитьОбъект();
	Если НЕ ЗначениеЗаполнено(ОбъектТП.Сотрудник) Тогда
		 ОбъектТП.Сотрудник = НайденноеФизЛицо;
		 ОбъектТП.Записать();
	КонецЕсли;	
		
	// По Константам
	Константы.ПрименятьВажностьВОбращении.Установить(ЭтаФорма.ПрименятьВажностьВОбращении);
	Константы.ВремяУдаленияЗаписиОбИсполнителе.Установить(ЭтаФорма.ВремяУдаленияЗаписиОбИсполнителе);
	Константы.ВремяУдаленияЗаписиОСообщении.Установить(ЭтаФорма.ВремяУдаленияЗаписиОСообщении);
	Константы.ВремяУдаленияЗаписиОСтатусе.Установить(ЭтаФорма.ВремяУдаленияЗаписиОСтатусе);
	Константы.ВремяУдаленияЗаписиФайла.Установить(ЭтаФорма.ВремяУдаленияЗаписиОФайле);
	
КонецПроцедуры

