#Область ОбработчикиКомандФормы
&НаКлиенте
Процедура Автозаполнить(Команда)
	АвтозаполнитьНаСервере();
КонецПроцедуры

&НаСервере
Процедура АвтозаполнитьНаСервере()
	
	МассивСотрудников = Новый Массив;
	Для Каждого Строка Из Объект.Выплаты Цикл
		МассивСотрудников.Добавить(Строка.Сотрудник);	
	КонецЦикла;
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ВКМ_ВзаиморасчетыССотрудникамиОстатки.Сотрудник,
		|	ВКМ_ВзаиморасчетыССотрудникамиОстатки.СуммаОстаток
		|ИЗ
		|	РегистрНакопления.ВКМ_ВзаиморасчетыССотрудниками.Остатки(&МоментВремени, Сотрудник В (&Массив)) КАК
		|		ВКМ_ВзаиморасчетыССотрудникамиОстатки";
	
	Запрос.УстановитьПараметр("МоментВремени", Объект.Дата);
	Запрос.УстановитьПараметр("Массив", МассивСотрудников);
	
	Выборка = Запрос.Выполнить().Выбрать();
	
	Для Каждого Строка Из Объект.Выплаты Цикл
		Если Выборка.НайтиСледующий(Новый Структура("Сотрудник", Строка.Сотрудник)) Тогда
			Строка.Сумма = Выборка.СуммаОстаток;			
		КонецЕсли;	
	КонецЦикла;

КонецПроцедуры

#КонецОбласти