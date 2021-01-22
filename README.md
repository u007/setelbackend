# Strapi application

start mysqldb:
```
cd seteldb && docker-compose up

```

start another terminal and run:

```
make setup
```


To run nodejs/strapi backend
based on mysql, running via knex library > bookshelf

```
npm run develop
```


Run payment api

```
cd payment && npm run start
```

To test api

```
make test
```

What is not covered:

* permissions and login access (ACL)

