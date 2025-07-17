/* create Database mydb_country*/
create database mydb_country;
use mydb_country;
/*create table country,city,customer*/
create table country(
	id int primary key,
    country_name varchar(255),
    country_name_eng  varchar(255),
    country_code varchar(10)
);
create table city(
	id int primary key,
    city_name  varchar(255),
    lat decimal(10,6),
    Long1 decimal(10,6),
    country_id int,
    foreign key (country_id) REFERENCES country(id)
);
create table customer (
	id int primary key,
    customer_name  varchar(255),
    city_id int,
    customer_address varchar(255),
    next_call_date date,
    ts_inserted datetime,
    foreign key (city_id) references city(id)
);
/*insert recode table Country */

insert into country values(1,'Deutschland','Germany','DEU'),
						   (2,'Srbija','Serbia','SRB'),
                           (3,'Hrvatska','Croatia','HRV'),
                           (4,'United States of America','United States of America','USA'),
                           (5,'Polska','Poland','POL'),
                           (6,'España','Spain','ESF'),
                           (7,'Rossiya','Russia','RUS');
	select * from country;
                           
/*insert Recode table city*/
insert into city values(1,'Berlin',52.520008,13.404954,1),
						(2,'Belgrade',44.787197,20.457273,2),
                        (3,'Zagreb',45.815395,15.966553,3),
                        (4,'New York',40.730610,73.935242,4),
                        (5,'Los Angeles',34.052235,118.243683,4),
                        (6,'Warsaw',52.237049,21.017532,5);
select * from city;
/* insert recode table customer*/
insert into customer values(1,'Jewelry Store',4,'Long Street 120','2020-03-21','2020-01-09 14:01:20.000');
insert into customer values (2,'Bakery',1,'Kurfurstendamm 25','2020-03-21','2020-01-09 17:52:10.000'),
							(3,'Cafe',1,'Tauentzienstraße 44','2020-03-21','2020-01-10 08:02:40.000'),
                            (4,'Restaurant',3,'Ulica Iva 15','2020-03-21','2020-01-10 09:20:21.000');
select * from customer;
/*-----------------------------------------------------------------------------------------------------*/
/* Taske1
 (join multiple tables using left join) 
List all Countries and customers related to these countries. 
For each country displaying its name in English, the name of the city customer is located in as 
well as the name of the customer.  
Return even countries without related cities and customers.
*/
SELECT
    c.country_name_eng AS "English",
    cy.city_name AS "City",
    cust.customer_name AS "Customer"
FROM
    country AS c
LEFT JOIN
    city AS cy ON c.id = cy.country_id
LEFT JOIN
    customer AS cust ON cy.id = cust.city_id
GROUP BY 
	c.country_name_eng,
    cy.city_name,
    cust.customer_name
ORDER BY   
	English;
/*-----------------------------------------------------------------------------------------------*/
/*
Task : 2 (join multiple tables using both left and inner join) 
Return the list of all countries that have pairs(exclude countries which are not referenced by any 
city). For such pairs return all customers. 
Return even pairs of not having a single customer 
*/
select 
	c.country_name_eng As Country,
    cy.city_name As city,
    cust.customer_name As Customer
FROM
    country AS c
left JOIN
    city AS cy ON c.id = cy.country_id
inner JOIN
    customer AS cust ON cy.id = cust.city_id
group by c.country_name_eng,cy.city_name,cust.customer_name
order by Country desc;
