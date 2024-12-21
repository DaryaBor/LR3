-- Создание таблицы Заказ
CREATE TABLE `Заказ` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `Название` VARCHAR(255),
    `Поставка` DATE,
    `Номер заказа` INT,
    `Продавец` VARCHAR(255),
    `Дата` DATE
);

-- Создание таблицы Поставка
CREATE TABLE `Поставка` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `Разгрузка` DATE,
    `Отгрузка` TIMESTAMP,
    `Куда` VARCHAR(255),
    `Стоимость` FLOAT,
    `Тип` ENUM('пакет', 'коробка'),
    `Время отправления` TIMESTAMP,
    `Время прибытия` TIMESTAMP,
    FOREIGN KEY (`ID`) REFERENCES `Заказ`(`ID`) ON DELETE CASCADE
);

-- Создание таблицы Разгрузка
CREATE TABLE `Разгрузка` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `РК` VARCHAR(255),
    `Дата` DATE,
    `Время начала` TIMESTAMP,
    `Время окончания` TIMESTAMP,
    FOREIGN KEY (`ID`) REFERENCES `Поставка`(`ID`) ON DELETE CASCADE
);

-- Создание таблицы Бригада
CREATE TABLE `Бригада` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `Название` VARCHAR(255)
);

-- Создание таблицы Рабочий
CREATE TABLE `Рабочий` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `Фамилия` VARCHAR(255),
    `Имя` VARCHAR(255),
    `Отчество` VARCHAR(255),
    `Пол` ENUM('Мужской', 'Женский'),
    `Дата рождения` DATE,
    `Номер договора` INT,
    FOREIGN KEY (`ID`) REFERENCES `Бригада`(`ID`) ON DELETE CASCADE
);

-- Связываем таблицу Рабочий с таблицей Бригада
ALTER TABLE `Рабочий` ADD FOREIGN KEY (`ID`) REFERENCES `Бригада`(`ID`) ON DELETE CASCADE;