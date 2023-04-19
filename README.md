# printmall
Tshirt marketplace

## How to start project?

1. clone repo in your terminal 
2. install [NodeJS](https://nodejs.org/) if you don`t have it yet. We use version 14.7. 
3. `cd` into `printmall/server` folder and type `npm install`
4. run backend-server type `npm start`
5. `cd` into `printmall/printmall` folder and type `npm install`
6. run the React project type `npm start`

## Install PostgreSQL
1. Download installation from official website [https://www.postgresql.org/download](https://www.postgresql.org/download/)
2. Create user and database
    * `sudo su - postgres`
    * `psql` go into PostgreSQL terminal
    * `\password postgres` to make password for user postgres
    * `CREATE USER printmall WITH PASSWORD 'market_0_o_place';` create new user
    * `CREATE DATABASE marketplacedb OWNER printmall;` create new database
    * `\q` for exit

3. Restore dump from normal terminal
     `psql -U printmall -d marketplacedb < db_v1.3.sql`
    
    Before Restore dump you need have an empty db with the same name,
    its mean if you already have old version of db you should open `psql` and then: 
    1. `DROP DATABASE marketplacedb;`
    2. `CREATE DATABASE marketplacedb OWNER printmall;`
    3. `\q` 

   Restore dump from normal terminal
     `psql -U printmall -d marketplacedb < marketplacedb.sql`
