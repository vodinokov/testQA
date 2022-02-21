﻿#language: ru

@tree

Функционал: создание документа поступления товаров

Как менеджер по закупкам я хочу
создание документа поступления товаров
чтобы поставить товар на учет 

контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа поступления товаров
// создание документа
И я закрываю все окна клиентского приложения

* заполнение документа
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* заполнение поставщика
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000001' | 'Поставщики'   |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Список" я выбираю текущую строку
* заполнение товаров
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000030' | 'Колбаса'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
*проверка заполнения
	Тогда таблица "Товары" содержит строки:
		| 'Товар'   | 'Цена' | 'Артикул' | 'Количество' | 'Сумма'    |
		| 'Колбаса' | '*'    | '*'       | '10,00'      | '2 500,00' |
	
	
	и я нажимаю на кнопку "записать"
* номер 
И я запоминаю значение поля "номер" как "$номер$"
* проведение документа
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* проверка документа
И таблица "Список" содержит строки:
	| 'номер' |
	| '$номер$'   |

сценарий: проверка наличия в справочнике номенклатуры торт
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
И таблица "Список" содержит строки:
	| 'Наименование' |
	| 'Торт '        |

