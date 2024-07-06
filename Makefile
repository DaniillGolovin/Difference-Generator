install:
	composer install

validate:
	composer validate

lint:
	composer exec --verbose phpcs -- --standard=PSR12 bin

stan:
	composer exec --verbose -- vendor/bin/phpstan analyse -l 6 ./src/


gendiff:
	./bin/gendiff -h