#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
	
#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	Движения.ВКМ_ДополнительныеНачисления.Записывать = Истина;
	Движения.ВКМ_ВзаиморасчетыССотрудниками.Записывать = Истина;
	Движения.ВКМ_Удержания.Записывать = Истина;
	
	
	ПериодРегистрации = НачалоМесяца(Дата);
	
	Для Каждого Строка Из СписокСотрудников Цикл
		Движение = Движения.ВКМ_ДополнительныеНачисления.Добавить();
		Движение.ВидРасчета = ПланыВидовРасчета.ВКМ_ДополнительныеНачисления.Премия;
		Движение.ПериодРегистрации = ПериодРегистрации;
		Движение.Результат = Строка.СуммаПремии;
		Движение.Сотрудник = Строка.Сотрудник;		
		
		Движение = Движения.ВКМ_Удержания.Добавить();
		Движение.ВидРасчета = ПланыВидовРасчета.ВКМ_Удержания.Налог;
		Движение.ПериодРегистрации = ПериодРегистрации;
		Движение.Результат = Строка.СуммаПремии * 0.13;
		Движение.Сотрудник = Строка.Сотрудник;	
		
		Движение = Движения.ВКМ_ВзаиморасчетыССотрудниками.ДобавитьПриход();
		Движение.Период = ПериодРегистрации;
		Движение.Сумма = Строка.СуммаПремии;
		Движение.Сотрудник = Строка.Сотрудник;	
		
		Движение = Движения.ВКМ_ВзаиморасчетыССотрудниками.ДобавитьРасход();
		Движение.Период = ПериодРегистрации;
		Движение.Сумма = Строка.СуммаПремии * 0.13;
		Движение.Сотрудник = Строка.Сотрудник;
	КонецЦикла;	
	
	Движения.Записать();
	

КонецПроцедуры

#КонецОбласти

#КонецЕсли