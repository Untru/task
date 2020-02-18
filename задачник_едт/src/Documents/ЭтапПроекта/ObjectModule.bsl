#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	ПроведениеСервер.ИнициализироватьДополнительныеСвойстваДляПроведения(Ссылка, ДополнительныеСвойства, РежимПроведения);

	Документы.ЭтапПроекта.ИнициализироватьДанныеДокумента(Ссылка, ДополнительныеСвойства);
	ПроведениеСервер.ПодготовитьНаборыЗаписейКРегистрацииДвижений(ЭтотОбъект);
	
	СебестоимостьСервер.ОтразитьСебестоимость(ДополнительныеСвойства, Движения, Отказ);
	ВзаиморасчетыСКлиентамиСервер.ОтразитьВзаиморасчеты(ДополнительныеСвойства, Движения, Отказ);
	
	ПроведениеСервер.ЗаписатьНаборыЗаписей(ЭтотОбъект);
	ПроведениеСервер.ОчиститьДополнительныеСвойстваДляПроведения(ДополнительныеСвойства);
КонецПроцедуры

Процедура ОбработкаУдаленияПроведения(Отказ)

//	ПроведениеСерверУТ.ИнициализироватьДополнительныеСвойстваДляПроведения(Ссылка, ДополнительныеСвойства);
//
//	ПроведениеСерверУТ.ПодготовитьНаборыЗаписейКРегистрацииДвижений(ЭтотОбъект);
//
//	СформироватьСписокРегистровДляКонтроля();
//	
//	ЗапасыСервер.ПодготовитьЗаписьТоваровОрганизаций(ЭтотОбъект, РежимЗаписиДокумента.ОтменаПроведения);
//	
//	РеализацияТоваровУслугЛокализация.ОбработкаУдаленияПроведения(ЭтотОбъект, Отказ);
//	
//	ПроведениеСерверУТ.ЗаписатьНаборыЗаписей(ЭтотОбъект);
//	
//	ПараметрыЗаполнения = ПараметрыЗаполненияВидовЗапасов(Истина);
//	ЗапасыСервер.СформироватьРезервыПоТоварамОрганизаций(ЭтотОбъект, Отказ, ПараметрыЗаполнения);
//	
//	ПроведениеСерверУТ.ВыполнитьКонтрольРезультатовПроведения(ЭтотОбъект, Отказ);
//	
//	РегистрыСведений.СостоянияЗаказовКлиентов.ОтразитьСостояниеЗаказа(ЭтотОбъект, Отказ);
//	
//	ДоставкаТоваров.ОтразитьСостояниеДоставки(Ссылка, Отказ, Истина);
//	ПроведениеСерверУТ.СформироватьЗаписиРегистровЗаданий(ЭтотОбъект);
//	
//	ПроведениеСерверУТ.ОчиститьДополнительныеСвойстваДляПроведения(ДополнительныеСвойства);
//	
//	ПараметрыРегистрации = Документы.РеализацияТоваровУслуг.ПараметрыРегистрацииСчетовФактурВыданных(ЭтотОбъект);
//	УчетНДСУП.АктуализироватьСчетаФактурыВыданныеПриУдаленииПроведения(ПараметрыРегистрации);	
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли

