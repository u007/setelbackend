OSNAME=$(shell uname -s)
NOW=$(shell date +'%Y%m%d_%H%M%S')

.PHONY: deploy build generators

deploy: build restart

dev:
	# kill $(ps -Af | grep "strapi develop" | grep -v grep | awk "{print $1}") | true && npx strapi develop
	npx strapi develop

dev-build:
	npx strapi build

setup:
	echo 'CREATE DATABASE openmenu CHARACTER SET utf8 COLLATE utf8_general_ci;' | mysql -u root -p000000 -h 127.0.0.1
	mysql -u root -p000000 -h 127.0.0.1 openmenu < seteldb/dump-openmenu-202101221908.sql

test:
	JEST_CIRCUS=1 npm run test


