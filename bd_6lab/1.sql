--1
--a
select *
from dealer
         cross join client; --on dealer.id = client.dealer_id;

--b
select d.name, c.name, c.city, c.priority, s.id, s.date, s.amount
from dealer d
         join client c on d.id = c.dealer_id
         join sell s on c.id = s.client_id;

--c
select d.name, c.name
from dealer d
         join client c on d.id = c.dealer_id
where d.location = c.city;

--d
select s.id, s.amount, c.name, c.city
from sell s
         join client c on s.client_id = c.id
where s.amount between 100 and 500;

--e
select d.name
from dealer d
         left join client c on d.id = c.dealer_id;

--f
select c.name, d.name, d.charge
from client c
         join dealer d on c.dealer_id = d.id
where c.dealer_id = d.id;

--g
select c.name, c.city, d.name, d.charge
from client c
         join dealer d on c.dealer_id = d.id
where d.charge > 0.12;

--h
select c.name, c.city, s.id, s.date, s.amount, d.name, d.charge
from client c
         left join dealer d on c.dealer_id = d.id
         join sell s on c.id = s.client_id;

--i
select c.name, c.priority, d.name, s.id, s.amount
from dealer d
         left join client c on d.id = c.dealer_id
         left join sell s on c.id = s.client_id
group by c.name, c.priority, d.name, s.id, s.amount
having count(c.id) >= 1
   or count(s.client_id) >= 1
    or (s.amount > 2000 and c.priority IS NOT NULL)
    or count(s.client_id) = 0;








--select c.name, c.priority, d.name, s.id, s.amount
--from dealer d
--         left join client c on d.id = c.dealer_id
--         left join sell s on c.id = s.client_id
--where s.amount > 2000 and c.priority is not null;
