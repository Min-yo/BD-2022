--1
--a
create view view_a as
select date, count(distinct client_id), avg(amount), sum(amount)
from sell
group by date;
select *
from view_a;

--b
create or replace view view_b as
select date
from sell
group by date
order by sum(amount) desc
limit 5;
select *
from view_b;

--c
create view view_c as
select d.name, count(sell.id), avg(amount), sum(amount)
from sell
         join dealer d on sell.dealer_id = d.id
group by d.name;
select *
from view_c;

--d
create or replace view view_d as
select d.location, sum(s.amount) * d.charge as earned
from sell s
         join dealer d on s.dealer_id = d.id
group by d.location, d.charge;
select *
from view_d;

--e
create view view_e as
select d.location, count(s.id), avg(amount), sum(amount)
from sell s
         join dealer d on s.dealer_id = d.id
group by d.location;
select *
from view_e;

--f
create view view_f as
select c.city, count(s.id), avg(amount), sum(amount)
from sell s
         join client c on s.dealer_id = c.id
group by c.city;
select *
from view_e;

--g
create or replace view view_tot_exp as
select d.location, sum(s.amount) as total1
from sell s
         join dealer d on d.id = s.dealer_id
group by d.location;

create view view_tot_am as
select c.city, sum(s.amount) as total
from sell s
         join client c on c.id = s.client_id
group by c.city;

create view view_g as
select exp.location, exp.total1, am.total
from view_tot_exp exp
         join view_tot_am am on exp.location = am.city
where exp.total1 > am.total;
select *
from view_g;