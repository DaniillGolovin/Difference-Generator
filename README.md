## CLI Differences Files
[![Maintainability](https://api.codeclimate.com/v1/badges/9b94c8580fc0c3482f4d/maintainability)](https://codeclimate.com/github/DaniillGolovin/Differences-Files/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/9b94c8580fc0c3482f4d/test_coverage)](https://codeclimate.com/github/DaniillGolovin/Differences-Files/test_coverage)

![PHP CI](https://github.com/DaniillGolovin/Differences-Files/actions/workflows/lint.yml/badge.svg)

### Описание проекта
В рамках данного проекта необходимо реализовать утилиту для поиска отличий в конфигурационных файлах.

Возможности утилиты:

```
Поддержка разных форматов: json, yaml
Генерация отчетов json, plain, pretty, stylish
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

Различия между файлами (JSON)
[![asciicast](https://asciinema.org/a/VFuhbZbIbB0HfzQLpaaqAXcYQ.svg)](https://asciinema.org/a/VFuhbZbIbB0HfzQLpaaqAXcYQ)

Различия между файлами (YML)
[![asciicast](https://asciinema.org/a/IGoMG2HCp6yb0sJ0B1Ca9WA7g.svg)](https://asciinema.org/a/IGoMG2HCp6yb0sJ0B1Ca9WA7g)

Различия между вложенными файлами (JSON)
[![asciicast](https://asciinema.org/a/XRkHZSchYetTA57ynC8x75HI1.svg)](https://asciinema.org/a/XRkHZSchYetTA57ynC8x75HI1)

Различия между вложенными файлами (YAML)
[![asciicast](https://asciinema.org/a/gBM9d0uB5jLgkWgyOtmW78q7V.svg)](https://asciinema.org/a/gBM9d0uB5jLgkWgyOtmW78q7V)

Сравнение файлов json/yaml в формате (PLAIN)
[![asciicast](https://asciinema.org/a/Gx4FhGD45KsO1jtRC9hEXuCoZ.svg)](https://asciinema.org/a/Gx4FhGD45KsO1jtRC9hEXuCoZ)