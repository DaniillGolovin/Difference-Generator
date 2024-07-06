## CLI Differences Files
[![Maintainability](https://api.codeclimate.com/v1/badges/9b94c8580fc0c3482f4d/maintainability)](https://codeclimate.com/github/DaniillGolovin/Differences-Files/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/9b94c8580fc0c3482f4d/test_coverage)](https://codeclimate.com/github/DaniillGolovin/Differences-Files/test_coverage)

![PHP CI](https://github.com/DaniillGolovin/Differences-Files/actions/workflows/lint.yml/badge.svg)

### Описание проекта
В рамках данного проекта необходимо реализовать утилиту для поиска отличий в конфигурационных файлах.

Возможности утилиты:

```
Поддержка разных форматов: json, yaml
Генерация отчетов json, plain, pretty
```

Пример использования:

```bash
$ bin/gendiff --format plain pathToFile1 pathTofile2
```

### Установка
Для глобальной установки выполните команду:
```bash
$ composer global require daniillgolovin/difrences-files
```

[![asciicast](https://asciinema.org/a/UE8ZFrteAHx1hIEHoYrWvHtsu.svg)](https://asciinema.org/a/UE8ZFrteAHx1hIEHoYrWvHtsu)