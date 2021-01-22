# Setel assignment backend


Model logics for order state and payment api integration in:

api/order/models/order.js

## To test api (requires Setup)

```
make test
```


## What is not covered:

* permissions and login access (ACL)



## Setup

to Start mysqldb:

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


start payment api

```
cd payment && npm run start
```



