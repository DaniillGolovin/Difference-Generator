install:
	composer install

validate:
	composer validate

lint:
	composer run-script phpcs -- --standard=PSR12 bin src tests -np

stan:
	composer exec --verbose -- vendor/bin/phpstan analyse -l 6 ./src/

gendiff:
	./bin/gendiff -h

test:
	composer run-script phpunit tests

test-coverage:
	XDEBUG_MODE=coverage composer exec --verbose phpunit tests -- --coverage-clover tests/build/logs/clover.xml