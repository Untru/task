// 14.10.2014 Кокорев В.Н.

Функция ПолучитьЦветаСтрок(Параметр) Экспорт
	ПолученнаяСтруктура = Новый Структура;
	ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Белый);
	ПолученнаяСтруктура.Вставить("ЦветШрифта",WebЦвета.Черный);
		
	Если Параметр = Перечисления.ЦветаСтрок.Белый Тогда
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Белый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Бежевый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Бежевый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Голубой Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Голубой);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Зеленый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Зеленый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Индиго Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Индиго);
		ПолученнаяСтруктура.Вставить("ЦветШрифта",WebЦвета.ТемноСерый)
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Коричневый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Коричневый);
		ПолученнаяСтруктура.Вставить("ЦветШрифта",WebЦвета.ТемноСерый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Краснофиолетовый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.КрасноФиолетовый);
		ПолученнаяСтруктура.Вставить("ЦветШрифта",WebЦвета.ТемноСерый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Лосось Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Лосось);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Малиновый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Малиновый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Розовый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Розовый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Светлозеленый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.СветлоЗеленый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Серебряный Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Серебряный);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Синий Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Синий);
		ПолученнаяСтруктура.Вставить("ЦветШрифта",WebЦвета.ТемноСерый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Темнооранжевый Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.ТемноОранжевый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.ЦианТемный Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.ЦианТемный);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Черный Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Черный);
		ПолученнаяСтруктура.Вставить("ЦветШрифта",WebЦвета.ТемноСерый);
	ИначеЕсли Параметр = Перечисления.ЦветаСтрок.Шоколадный Тогда	
		ПолученнаяСтруктура.Вставить("ЦветСтроки",WebЦвета.Шоколадный);
	КонецЕсли;	
	
	Возврат ПолученнаяСтруктура;
КонецФункции	

Функция ПолучитьВидыОбращений(Параметр) Экспорт
	Если Параметр = "Внутренние" Тогда
		Возврат Перечисления.ВидОбращений.ВнутренниеОбращения;
	Иначе
		Возврат Перечисления.ВидОбращений.ВнешниеОбращения;
	КонецЕсли;	
КонецФункции

Функция ПолучитьТипПрименяемыхОбращений(Параметр) Экспорт
	Если Параметр = "ТолькоВнутренние" Тогда
		Возврат Перечисления.ТипПрименяемыхОбращений.ТолькоВнутренниеОбращения;
	ИначеЕсли Параметр = "ТолькоВнешние" Тогда
		Возврат Перечисления.ТипПрименяемыхОбращений.ТолькоВнешниеОбращения;
	Иначе
		Возврат Перечисления.ТипПрименяемыхОбращений.ВнутренниеИВнешниеОбращения;
	КонецЕсли;	
КонецФункции

Функция ПолучитьНастройкиПользователя(ТекПольз,Настройка) Экспорт
	Если Настройка = "ТипПрименяемыхОбращений" Тогда
		Возврат ТекПольз.НастройкиПользователя.ТипПрименяемыхОбращений;
	ИначеЕсли Настройка = "ОбращенияПоУмолчанию" Тогда
	    Возврат ТекПольз.НастройкиПользователя.ОбращенияПоУмолчанию;
	ИначеЕсли Настройка = "АвтоОткрытииРабочегоСтолаОбращений" Тогда
	    Возврат ТекПольз.НастройкиПользователя.АвтоОткрытииРабочегоСтолаОбращений;
	ИначеЕсли Настройка = "ИсполнительПоУмолчанию" Тогда
	    Возврат ТекПольз.НастройкиПользователя.ИсполнительПоУмолчанию;
	ИначеЕсли Настройка = "ОтделПоУмолчанию" Тогда
	    Возврат ТекПольз.НастройкиПользователя.ОтделПоУмолчанию;
	ИначеЕсли Настройка = "КатегорияПоУмолчанию" Тогда
	    Возврат ТекПольз.НастройкиПользователя.КатегорияПоУмолчанию;
		
	КонецЕсли;
КонецФункции	

Функция ТекущийПользователь() Экспорт
	Возврат ПараметрыСеанса.ТекущийПользователь;
КонецФункции	

Функция ПолучитьКонстантыВремениУдаленияЗаписей(Параметр) Экспорт
	Если Параметр = "ВремяУдаленияЗаписиОСтатусе" Тогда
		Возврат Константы.ВремяУдаленияЗаписиОСтатусе.Получить();
	ИначеЕсли Параметр = "ВремяУдаленияЗаписиОСообщении" Тогда
		Возврат Константы.ВремяУдаленияЗаписиОСообщении.Получить();
	ИначеЕсли Параметр = "ВремяУдаленияЗаписиОбИсполнителе" Тогда
		Возврат Константы.ВремяУдаленияЗаписиОбИсполнителе.Получить();
	Иначе 
		Возврат Константы.ВремяУдаленияЗаписиФайла.Получить();
	КонецЕсли	
КонецФункции	

//Возвращает список значений
//Отдел - текущий отдел
&НаСервере
Функция ПолучитьСотрудниковОтдела(Отдел) Экспорт
	СЗ = Новый СписокЗначений;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	СотрудникиОтделов.Сотрудник
		|ИЗ
		|	РегистрСведений.СотрудникиОтделов КАК СотрудникиОтделов
		|ГДЕ
		|	СотрудникиОтделов.Отдел = &Отдел";
	
	Запрос.УстановитьПараметр("Отдел", Отдел);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		СЗ.Добавить(ВыборкаДетальныеЗаписи.Сотрудник);
	КонецЦикла;
	
	Возврат СЗ;

КонецФункции	

Процедура ДобавитьПрисоединенныйФайл(ИмяФайла,ВладелецФайла) Экспорт
	ВыбФайл = Новый Файл(ИмяФайла);
	ХРФайла = Новый ХранилищеЗначения(Новый ДвоичныеДанные(ИмяФайла),Новый СжатиеДанных(9));
	ЗаписьРС = РегистрыСведений.ПрисоединенныеФайлы.СоздатьНаборЗаписей();
	ЗаписьРС.Прочитать();
	НоваяСтрока = ЗаписьРС.Добавить();
	НоваяСтрока.ВладелецФайла = ВладелецФайла;
	НоваяСтрока.Период = ТекущаяДата();
	НоваяСтрока.ИмяФайла = ВыбФайл.Имя;
	НоваяСтрока.РазмерФайла = ВыбФайл.Размер();
	НоваяСтрока.Добавил = ТекущийПользователь().Сотрудник;
	НоваяСтрока.ХранимыйФайл  = ХРФайла;
	ЗаписьРС.Записать();
КонецПроцедуры	

Процедура ПользовательФоновогоЗадания() Экспорт
	Если ПараметрыСеанса.ТекущийПользователь.Наименование = "<Не определен>" Тогда
		СпрПользователей=Справочники.Пользователи;
		ЭлементСпр = СпрПользователей.НайтиПоРеквизиту("ИдентификаторПользователяИБ",ПараметрыСеанса.ТекущийПользователь.ИдентификаторПользователяИБ);
		Если  НЕ ЭлементСпр = СпрПользователей.ПустаяСсылка() Тогда
			Объект = ЭлементСпр.ПолучитьОбъект();
			Объект.Наименование = "Фоновое задание: ID -" +Лев(ЭлементСпр.ИдентификаторПользователяИБ,13)+"...";
			Объект.Записать();
		КонецЕсли;	
	КонецЕсли;	
КонецПроцедуры	

Функция ЗапускСтартовогоПомощника() Экспорт
	ВозможноЗапуститьСтартовыйПомощник = "Отказ";
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Организации.Ссылка
		|ИЗ
		|	Справочник.Организации КАК Организации";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если РезультатЗапроса.Пустой() Тогда
		 Если НЕ РольДоступна("ПолныеПрава") Тогда
			 ВозможноЗапуститьСтартовыйПомощник = "НетДоступа";
		 Иначе
			 ВозможноЗапуститьСтартовыйПомощник = "Возможно";
		 КонецЕсли;	 
	КонецЕсли;
	
	Возврат ВозможноЗапуститьСтартовыйПомощник;
КонецФункции	

#Область ПроцедурыФоновыхРегламентныхЗаданий

Процедура ЗагрузкаОбращенийПоEmailФоновоеЗадание() Экспорт
	// Проверим пользователя фонового задания и установим его имя если не определено
	ОбщийМодульСервер.ПользовательФоновогоЗадания();
	
	//Получить автора обращения при загрузке по почте
	АвторОбращенияEmail = Справочники.ФизическиеЛица.НайтиПоНаименованию("Автозагрузка по E-mail");
	Если НЕ ЗначениеЗаполнено(АвторОбращенияEmail) Тогда
		 АвторОбращенияEmail = Справочники.ФизическиеЛица.СоздатьЭлемент();
		 АвторОбращенияEmail.Наименование = "Автозагрузка по E-mail";
		 АвторОбращенияEmail.Записать();
	КонецЕсли;	
	
	// Загрузка сообщений
	ПараметрыЗагрузки = Новый Структура;
	//ПараметрыЗагрузки.Вставить("Колонки", "ИмяОтправителя, Вложения, Тема, ДатаОтправления, ОбратныйАдрес");
	
	ТаблицаВходящихСообщений = РаботаСЭлектроннойПочтой.ЗагрузитьСообщения(Константы.ЗагрузкаОбращенийУчетнаяЗаписьПочты.Получить(),ПараметрыЗагрузки);
	Для Каждого Элемент Из ТаблицаВходящихСообщений Цикл
		АдресЭлПочтыОтправителя = СокрЛП(Сред(Элемент.Отправитель,Найти(Элемент.Отправитель,"<")+1,СтрДлина(Элемент.Отправитель)-Найти(Элемент.Отправитель,"<")-1));
		
		ДокОбращение = Документы.ОбращениеВПоддержку.СоздатьДокумент();
		ДокОбращение.Дата = ТекущаяДата();
		
		АвторПоЭлПочте = НайтиАвтораПоEmail(АдресЭлПочтыОтправителя);
		ДокОбращение.Автор = ?(ЗначениеЗаполнено(АвторПоЭлПочте), АвторПоЭлПочте, АвторОбращенияEmail);
		Если Константы.ПрименятьВажностьВОбращении.Получить() Тогда
			Если Элемент.Важность = "Наивысшая" ИЛИ Элемент.Важность = "Высокая" Тогда
				ДокОбращение.Важность = Перечисления.ВидВажности.Высокая;
			Иначе
				ДокОбращение.Важность = Перечисления.ВидВажности.Обычная;
			КонецЕсли;
		КонецЕсли;	
		ДокОбращение.АдресЭлектроннойПочты = АдресЭлПочтыОтправителя;
		ДокОбращение.ТекущийИсполнитель = Справочники.ФизическиеЛица.НайтиПоНаименованию("Нераспределено");
		ДокОбращение.Заголовок = Элемент.Тема;
		//Обработка Текстов
		Для Каждого ПолТексты Из Элемент.Тексты Цикл
			Если ПолТексты.Получить("ТипТекста")="ПростойТекст" Тогда
				ДокОбращение.Описание = СокрЛП(ПолТексты.Получить("Текст"));				
			КонецЕсли	
		КонецЦикла;
		// Добавим Статус
		СтатусНовое = Справочники.Статусы.Новое;
		НоваяСтрока = ДокОбращение.Статусы.Добавить();
		НоваяСтрока.Дата = ТекущаяДата();
		НоваяСтрока.Статус = СтатусНовое;
		НоваяСтрока.Добавил = АвторОбращенияEmail;
		ДокОбращение.ТекущийСтатус = СтатусНовое;
		
		
		// Обращение от находим по email
		Запрос = Новый Запрос;
		Запрос.Текст = 
		"ВЫБРАТЬ
		|	Контрагенты.Ссылка КАК Ссылка,
		|	Контрагенты.КонтактноеЛицо КАК КонтактноеЛицо,
		|	Контрагенты.Телефон КАК Телефон
		|ИЗ
		|	Справочник.Контрагенты КАК Контрагенты
		|ГДЕ
		|	Контрагенты.АдресЭлектроннойПочты = &АдресЭлектроннойПочты
		|
		|ОБЪЕДИНИТЬ ВСЕ
		|
		|ВЫБРАТЬ
		|	СотрудникиОтделов.Отдел,
		|	СотрудникиОтделов.Сотрудник.Наименование,
		|	СотрудникиОтделов.Сотрудник.Телефон
		|ИЗ
		|	РегистрСведений.СотрудникиОтделов КАК СотрудникиОтделов
		|ГДЕ
		|	СотрудникиОтделов.Сотрудник.АдресЭлектроннойПочты = &АдресЭлектроннойПочты
		|	И СотрудникиОтделов.ВидМестаРаботы = &ВидМестаРаботы";
		
		Запрос.УстановитьПараметр("АдресЭлектроннойПочты", АдресЭлПочтыОтправителя);
		Запрос.УстановитьПараметр("ВидМестаРаботы", Перечисления.ВидМестаРаботы.ОсновноеМесто);
		
		РезультатЗапроса = Запрос.Выполнить();
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			ДокОбращение.ОбращениеОт = ВыборкаДетальныеЗаписи.Ссылка;
			ДокОбращение.КонтактноеЛицо =  ВыборкаДетальныеЗаписи.КонтактноеЛицо;
			ДокОбращение.Телефон =  ВыборкаДетальныеЗаписи.Телефон;
		КонецЦикла;
		
		//Обработка вложений
		Для Каждого Вложение Из Элемент.Вложения Цикл
			ИмяФайла = Вложение.Ключ;
			Данные = Вложение.Значение;
			
			ХРФайла = Новый ХранилищеЗначения(Данные,Новый СжатиеДанных(9));
			НоваяСтрока = ДокОбращение.ВложенныеФайлы.Добавить();
			НоваяСтрока.ВложенныйФайл = ХРФайла;
			НоваяСтрока.ПредставлениеФайла = ИмяФайла;
			
			//ЗаписьРС = РегистрыСведений.ПрисоединенныеФайлы.СоздатьНаборЗаписей();
			//ЗаписьРС.Прочитать();
			//НоваяСтрока = ЗаписьРС.Добавить();
			//НоваяСтрока.ВладелецФайла = ДокОбращение.Ссылка;
			//НоваяСтрока.Период = ТекущаяДата();
			//НоваяСтрока.ИмяФайла = ИмяФайла;
			//НоваяСтрока.РазмерФайла = Данные.Размер();
			//НоваяСтрока.Добавил = АвторОбращенияEmail;
			//НоваяСтрока.ХранимыйФайл  = ХРФайла;
			//Попытка
			//	ЗаписьРС.Записать();
			//Исключение
			//	ЗаписьЖурналаРегистрации("Не корректно записаны файлы вложения, загружаемый по Email от "+Элемент.Отправитель, УровеньЖурналаРегистрации.Ошибка,,
			//	ДокОбращение, ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
			//КонецПопытки;
		КонецЦикла;
		
		Попытка
			ДокОбращение.Записать(РежимЗаписиДокумента.Проведение);
		Исключение
			ЗаписьЖурналаРегистрации("Не сохранен документ <Обращение>, загружаемый по Email от "+Элемент.Отправитель, УровеньЖурналаРегистрации.Ошибка,,
			ДокОбращение, ПодробноеПредставлениеОшибки(ИнформацияОбОшибке()));
		КонецПопытки;
	КонецЦикла;

КонецПроцедуры

Процедура ВключитьЗаданиеЗагрузкаОбращенийПоEmail() Экспорт
	Если РольДоступна("ПолныеПрава") Тогда
		ЗаданиеЗагрузкаПоПочте = РегламентныеЗадания.НайтиПредопределенное("ЗагрузкаОбращенийПоEmail");
		Если НЕ Константы.ЗагружатьОбращенияПоEmail.Получить() Тогда
			ЗаданиеЗагрузкаПоПочте.Использование = Ложь;
		Иначе
			ЗаданиеЗагрузкаПоПочте.Использование = Истина;
		КонецЕсли;
		ЗаданиеЗагрузкаПоПочте.Записать();
	КонецЕсли;
КонецПроцедуры

Функция НайтиАвтораПоEmail(Email)
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("Email", Email);
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ФизическиеЛица.Ссылка
	|ИЗ
	|	Справочник.ФизическиеЛица КАК ФизическиеЛица
	|ГДЕ
	|	ФизическиеЛица.АдресЭлектроннойПочты = &Email";
	Результат = Запрос.Выполнить().Выбрать();
	
	Если Результат.Следующий() Тогда 
		Возврат Результат.Ссылка;
	Иначе
		Возврат Неопределено;
	КонецЕсли;
КонецФункции

#КонецОбласти
