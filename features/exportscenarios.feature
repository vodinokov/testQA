﻿#language: ru

@tree

Функционал: тест на проверку расчета поля количество используя экспортный сценарий

Как менеджер по закупкам я хочу
провести тест на проверку расчета суммы заказа при изменении количества и цены 
чтобы вычисления были корректными
контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: тест на проверку расчета поля количество используя экспортный сценарий
и проверка расчета суммы заказа при изменении количества и цены
* зависимость ВидЦен от значения покупатель
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Корнет ЗАО'
	Тогда элемент формы с именем "ВидЦен" стал равен 'Закупочная'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '150,00' | '10'         | '1 500,00' |
		| 'Хлеб'  | '15,00'  | '5'          | '75,00'    |
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	Тогда элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '250,00' | '10'         | '2 500,00' |
		| 'Хлеб'  | '25,00'  | '5'          | '125,00'   |
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	Тогда элемент формы с именем "ВидЦен" стал равен 'Оптовая'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '200,00' | '10'         | '2 000,00' |
		| 'Хлеб'  | '20,00'  | '5'          | '100,00'   |

* и проверка создания документа
и проверка создания документа
