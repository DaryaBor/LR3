### Таблица 'Поставщик'
SQL

CREATE TABLE Поставщик (
    ID INT PRIMARY KEY,
    Название VARCHAR(200) NOT NULL,
    Адрес VARCHAR(200),
    Телефон VARCHAR(200),
    Email VARCHAR(200)
);

### Таблица 'Товар'
SQL

CREATE TABLE Товар (
    ID INT PRIMARY KEY,
    Название VARCHAR(200) NOT NULL,
    Описание TEXT,
    Количество INT DEFAULT 0,
    Цена DECIMAL(10,2) DEFAULT 0.00,
    Категория VARCHAR(200)
);

### Таблица 'Заказ'
SQL

CREATE TABLE Заказ (
    ID INT PRIMARY KEY,
    Дата DATETIME NOT NULL,
    Срок_годности DATE,
    Сток_годен INT DEFAULT 0,
    Доставка BOOLEAN DEFAULT FALSE,
    Отгрузка BOOLEAN DEFAULT FALSE,
    Состояние VARCHAR(200) DEFAULT 'Новый',
    FK1_ID INT,
    FK2_ID INT,
    FOREIGN KEY (FK1_ID) REFERENCES Поставщик(ID),
    FOREIGN KEY (FK2_ID) REFERENCES Товар(ID)
);

### Таблица 'Рабочий'
SQL

CREATE TABLE Рабочий (
    ID INT PRIMARY KEY,
    ФИО VARCHAR(200) NOT NULL,
    Номер_телефона VARCHAR(200),
    Email VARCHAR(200)
);

### Таблица 'Подразделение'
SQL

CREATE TABLE Подразделение (
    ID INT PRIMARY KEY,
    Название VARCHAR(200) NOT NULL,
    Адрес VARCHAR(200),
    Телефон VARCHAR(200),
    Email VARCHAR(200)
);

### Таблица 'Сотрудник'
SQL

CREATE TABLE Сотрудник (
    ID INT PRIMARY KEY,
    Фамилия VARCHAR(200) NOT NULL,
    Имя VARCHAR(200) NOT NULL,
    Отчество VARCHAR(200),
    Должность VARCHAR(200),
    Зарплата DECIMAL(10,2) DEFAULT 0.00,
    FK1_ID INT,
    FK2_ID INT,
    FOREIGN KEY (FK1_ID) REFERENCES Подразделение(ID),
    FOREIGN KEY (FK2_ID) REFERENCES Рабочий(ID)
);

### Таблица 'Договор'
SQL

CREATE TABLE Договор (
    ID INT PRIMARY KEY,
    Дата DATETIME NOT NULL,
    Условия VARCHAR(200),
    FK1_ID INT,
    FK2_ID INT,
    FOREIGN KEY (FK1_ID) REFERENCES Рабочий(ID),
    FOREIGN KEY (FK2_ID) REFERENCES Поставщик(ID)
);