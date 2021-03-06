
&НаКлиенте
Процедура НажатиеОК(Команда)
	Если НЕ ЗначениеЗаполнено(Отдел) Тогда
		Сообщить("Не заполнено поле отдел.");
	ИначеЕсли НЕ ЗначениеЗаполнено(Категория) Тогда
		Сообщить("Не заполнено поле категория.");
	Иначе
		ДопПараметры = ЭтаФорма.ОписаниеОповещенияОЗакрытии.ДополнительныеПараметры;
		ДопПараметры.Вставить("РежимДобавления","Исполнитель");
		ДопПараметры.Вставить("Категория",Категория);
		ДопПараметры.Вставить("Отдел",Отдел);
		ДопПараметры.Вставить("Исполнитель",Исполнитель);
		ЭтаФорма.Закрыть();
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура КатегорияПриИзменении(Элемент)
	КатегорияПриИзмененииНаСервере();
	СозданиеПараметровВыбораПоИсполнителям();
КонецПроцедуры

&НаСервере
Процедура КатегорияПриИзмененииНаСервере()
	Отдел = Категория.Отдел;
КонецПроцедуры

&НаКлиенте
Процедура СозданиеПараметровВыбораПоИсполнителям()
	СЗ =  ОбщийМодульСервер.ПолучитьСотрудниковОтдела(Отдел);
	НовыйПараметр = Новый ПараметрВыбора("Отбор.Ссылка", ?(СЗ.Количество()>0,СЗ,Исполнитель.Пустая()));
	НовыйМассив = Новый Массив();
	НовыйМассив.Добавить(НовыйПараметр);		
	НовыеПараметры = Новый ФиксированныйМассив(НовыйМассив);
	Элементы.Исполнитель.ПараметрыВыбора = НовыеПараметры;
КонецПроцедуры	

&НаКлиенте
Процедура ОтделПриИзменении(Элемент)
	Исполнитель = Исполнитель.Пустая();
	СозданиеПараметровВыбораПоИсполнителям();
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	СозданиеПараметровВыбораПоИсполнителям();
КонецПроцедуры
