
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

// Автозаполнение по договору ПодвойскаяАВ 10.11.2023
&НаКлиенте
Процедура ВКМ_Заполнить(Команда)
	ВКМ_ЗаполнитьНаСервере();
	РассчитатьСуммуДокумента();
КонецПроцедуры
// ПодвойскаяАВ 10.11.2023

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество;
	
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

// +++ Автозаполнение по договору ПодвойскаяАВ 10.11.2023 
&НаСервере
Процедура ВКМ_ЗаполнитьНаСервере()

	Если Объект.Договор.ВидДоговора = Перечисления.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание Тогда
		ТекОбъект = РеквизитФормыВЗначение("Объект");
		ТекОбъект.ВыполнитьАвтозаполнение();
		ЗначениеВРеквизитФормы(ТекОбъект, "Объект");	
	КонецЕсли;
	
КонецПроцедуры
// --- ПодвойскаяАВ 10.11.2023

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
