install:
	composer install

validate:
	composer validate

lint:
	composer exec --verbose phpcs -- --standard=PSR12 bin src tests

stan:
	composer exec --verbose -- vendor/bin/phpstan analyse -l 6 ./src/

gendiff:
	./bin/gendiff -h

test:
	composer run-script phpunit tests

test-coverage:
	XDEBUG_MODE=coverage composer exec --verbose phpunit tests -- --coverage-clover tests/build/logs/clover.xml