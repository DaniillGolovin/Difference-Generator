<h1 align="">Вычислитель отличий</h1>

[![Maintainability](https://api.codeclimate.com/v1/badges/9b94c8580fc0c3482f4d/maintainability)](https://codeclimate.com/github/DaniillGolovin/Differences-Files/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9b94c8580fc0c3482f4d/test_coverage)](https://codeclimate.com/github/DaniillGolovin/Differences-Files/test_coverage)
![linter and tests](https://github.com/DaniillGolovin/Differences-Files/actions/workflows/lint.yml/badge.svg)

## Описание

>**«Вычислитель отличий»** — программа, определяющая разницу между двумя структурами данных. Это популярная задача, для решения которой существует множество онлайн сервисов, например [JSON Diff](http://www.jsondiff.com/ 'JSON Diff'). Подобный механизм используется при выводе тестов или при автоматическом отслеживании изменений в конфигурационных файлах.

В рамках данного проекта реализовано создание **AST** (_англ._ Abstract Syntax Tree) - абстрактного синтаксического дерева, на основании которого имеющиеся форматеры (<code>stylish</code>, <code>plain</code>, <code>json</code>) выводят различия как **плоских**, так и **вложенных** файлов (используется _рекурсия_).

### Особенности

- [x] Доступны следующие форматы для чтения: <code>JSON</code>, <code>YAML</code>.
- [x] Реализованы следующие форматеры: <code>stylish</code> (по умолчанию), <code>plain</code>, <code>json</code>.
- [x] Возможность использовать как _библиотеку_, так и как <code>CLI</code> команду.
`

## Установка

```
⚠️ Перед установкой проекта проверьте наличие установленных php, composer!
```

Для работы с проектом необходимо выполнить следующие действия по его установке:

1. Склонируйте репозиторий, используя одну из следующих консольных команд:

```bash
# HTTPS
>> git clone https://github.com/DaniillGolovin/Difference-Generator.git
# SSH
>> git clone git@github.com:DaniillGolovin/Difference-Generator.git
```

2. Осуществите установку проекта:

```bash
>> make install
```

3. Запустите команду на примере тех, которые указаны [ниже](#использование).

Для глобальной установки выполните команду:
```bash
$ composer global require daniillgolovin/difrences-files
```

## Использование

### CLI команда

Данный проект можно использовать как утилиту _командной строки_. Подробности использования описания в **helper**:

```bash
>> gendiff -h
```

```bash
gendiff -h

Generate diff

Usage:
  gendiff (-h|--help)
  gendiff (-v|--version)
  gendiff [--format <fmt>] <firstFilePath> <secondFilePath>

Options:
  -h --help                    Show this screen
  -v --version                 Show version
  --format <fmt>               Report format [default: stylish] Examples: stylish, plain, json
```

#### Формат <code>stylish</code>

Данный форматер выводит разницу между двумя файлами, учитывая следующие особенности:

- Если свойство было **добавлено** и **удалено** либо **изменило** свое значение, то указываются знаки <code>+</code> и <code>-</code> соответственно.
- В остальных случаях свойство либо **не изменилось**, либо в **обоих файлах** имеет в качестве значения _объект_ (является **вложенным**).

##### Пример

```bash
>> gendiff file1.json file2.json
```

```bash
{
  - follow: false
    host: hexlet.io
  - proxy: 123.234.53.22
  - timeout: 50
  + timeout: 20
  + verbose: true
}
```

##### Различия между плоскими файлами (JSON) формат (STYLISH)

[![asciicast](https://asciinema.org/a/VFuhbZbIbB0HfzQLpaaqAXcYQ.svg)](https://asciinema.org/a/VFuhbZbIbB0HfzQLpaaqAXcYQ)

##### Различия между плоскими файлами (YAML) формат (STYLISH)

[![asciicast](https://asciinema.org/a/IGoMG2HCp6yb0sJ0B1Ca9WA7g.svg)](https://asciinema.org/a/IGoMG2HCp6yb0sJ0B1Ca9WA7g)

##### Различия между вложенными файлами (JSON) формат (STYLISH)

[![asciicast](https://asciinema.org/a/XRkHZSchYetTA57ynC8x75HI1.svg)](https://asciinema.org/a/XRkHZSchYetTA57ynC8x75HI1)

##### Различия между вложенными файлами (YAML) формат (STYLISH)

[![asciicast](https://asciinema.org/a/gBM9d0uB5jLgkWgyOtmW78q7V.svg)](https://asciinema.org/a/gBM9d0uB5jLgkWgyOtmW78q7V)

#### Формат <code>plain</code>

Данный форматер выводит разницу между двумя файлами, учитывая следующие особенности:

- Если свойство имеет _"сложное значение"_ (_объект_, _массив_), то выводится <code>[complex value]</code>.
- Если свойство является _вложенным_, то оно **не учитывается**: сохраняется лишь путь до него, который используется при выводе остальных _"плоских"_ свойств, находящийся внутри оного.
- Если свойство **не было** изменено, то оно **не выводится**.

##### Пример

```bash
>> gendiff file5.json file6.json --format plain
```

```bash
Property 'common.follow' was added with value: false
Property 'common.setting2' was removed
Property 'common.setting3' was updated. From true to null
Property 'common.setting4' was added with value: 'blah blah'
Property 'common.setting5' was added with value: [complex value]
Property 'common.setting6.doge.wow' was updated. From '' to 'so much'
Property 'common.setting6.ops' was added with value: 'vops'
Property 'group1.baz' was updated. From 'bas' to 'bars'
Property 'group1.nest' was updated. From [complex value] to 'str'
Property 'group2' was removed
Property 'group3' was added with value: [complex value]
```

##### Различия между плоскими файлами (JSON) формат (PLAIN)

[![asciicast](https://asciinema.org/a/0CIQym3w686v9iPlgYxAXqwud.svg)](https://asciinema.org/a/0CIQym3w686v9iPlgYxAXqwud)

##### Различия между плоскими файлами (YAML) формат (PLAIN)

[![asciicast](https://asciinema.org/a/rLKzEsChI2y9EtkaNAMGlPK6m.svg)](https://asciinema.org/a/rLKzEsChI2y9EtkaNAMGlPK6m)

##### Различия между вложенными файлами (JSON) формат (PLAIN)

[![asciicast](https://asciinema.org/a/Jwjfyec1KUE31O7A4ZniYg9yd.svg)](https://asciinema.org/a/Jwjfyec1KUE31O7A4ZniYg9yd)

##### Различия между вложенными файлами (YAML) формат (PLAIN)

[![asciicast](https://asciinema.org/a/qr9pbdJnm1tafQYdtlCKKk1oc.svg)](https://asciinema.org/a/qr9pbdJnm1tafQYdtlCKKk1oc)

#### Формат <code>json</code>

Данный форматер выводит разницу между двумя файлами, учитывая следующие особенности:

- Если свойство не является _вложенным_ или _"сложным"_ то указывается его **имя**, **дескриптор**, **старое значение**, **новое значение**, **дети** в формате: <code>{ state: 'СОСТОЯНИЕ', type: 'ТИП', oldValue: 'ЗНАЧЕНИЕ в file1' oldValue: 'ЗНАЧЕНИЕ в file2' children: 'ДЕТИ' }</code>.


##### Пример

```bash
>> gendiff file1.yaml file2.yaml --format json
```

```bash
{
  {
    "key":"follow",
    "type":"removed",
    "oldValue":null,
    "newValue":false
    },
  }
  {
    "key":"host",
    "type":"not updated",
    "oldValue":"hexlet.io",
    "newValue":"hexlet.io"
  },
  {
    "key":"proxy","type":"removed",
    "oldValue":null,
    "newValue":"123.234.53.22"
  },
  {
      "key":"timeout",
      "type":"updated",
      "oldValue":50,
      "newValue":20
  },
  {
      "key":"verbose",
      "type":"added",
      "oldValue":null,
      "newValue":true
  }
}
```

##### Различия между плоскими файлами (JSON) формат (JSON)

[![asciicast](https://asciinema.org/a/heg3C4owGuBEbXANMfALz9il0.svg)](https://asciinema.org/a/heg3C4owGuBEbXANMfALz9il0)

##### Различия между плоскими файлами (YAML) формат (JSON)

[![asciicast](https://asciinema.org/a/QOUjqvSIn0E2gRik3ksUmXABJ.svg)](https://asciinema.org/a/QOUjqvSIn0E2gRik3ksUmXABJ)

##### Различия между вложенными файлами (JSON) формат (JSON)

[![asciicast](https://asciinema.org/a/566FhWZxYMr8vBB7dtp35a00f.svg)](https://asciinema.org/a/566FhWZxYMr8vBB7dtp35a00f)

##### Различия между вложенными файлами (YAML) формат (JSON)

[![asciicast](https://asciinema.org/a/lCKKCTNJx0eXoUvuu90sxX9kW.svg)](https://asciinema.org/a/lCKKCTNJx0eXoUvuu90sxX9kW)

## Структура проекта

```bash
..
├── Makefile
├── README.md
├── bin
│   └── gendiff
├── composer.json
├── composer.lock
├── coverage.txt
├── file.txt
├── phpunit.xml
├── src
│   ├── Differ.php
│   ├── Formatters
│   │   ├── Json.php
│   │   ├── Plain.php
│   │   └── Stylish.php
│   ├── Formatters.php
│   └── Parsers.php
└── tests
    ├── GenDiffTest.php
    └── fixtures
        ├── diff.txt
        ├── diffJson.txt
        ├── diffPlain.txt
        ├── diffStylish.txt
        ├── file1.json
        ├── file1.yml
        ├── file2.json
        ├── file2.yml
        ├── fileNest1.json
        ├── fileNest1.yml
        ├── fileNest2.json
        └── fileNest2.yml

5 directories, 27 files

```
