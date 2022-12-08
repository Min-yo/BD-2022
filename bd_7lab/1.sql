--1
--a
create
    or replace function get_incr_by1(a int)
    returns int
    language plpgsql as
$$
begin
    return a + 1;
END;
$$;
select *
from get_incr_by1(1);


--b
create
    or replace function get_sum(a int, b int)
    returns int as
$$
begin
    return a + b;
END;
$$
    language plpgsql;
select *
from get_sum(1, 3);


--c
create
    or replace function if_even(a int, b int)
    returns bool as
$$
begin
    return (a % 2 = 0 and b % 2 = 0);
END;
$$
    language plpgsql;
select *
from if_even(2, 4);


--d
create
    or replace function check_pas(s varchar)
    returns bool as
$$
begin
    return s like 'S%' ;
END;
$$
    language plpgsql;
select *
from check_pas('Some_password');


--e
create
    or replace function if_divides_on_3and4(a int, out divides_by_3 bool, out divides_by_4 bool)
as
$$
begin
    divides_by_3 := a % 3 = 0;
    divides_by_4 := a % 4 = 0;
END;
$$
    language plpgsql;
select *
from if_divides_on_3and4(4);


--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ 2 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--a
create function insert_timestamp()
    returns trigger
    language plpgsql
as
$$
begin
    raise notice '%',current_timestamp;
    return new;
end;
$$;

create or replace trigger time_of_action_trigger
    before insert on lab7
    for each row
execute function insert_timestamp();

insert into lab7 values(3, 'Mike', '1979-02-17 12:18:31.056275', 34, 55000, 10, 10);

--b
drop function get_age();
create function get_age()
    returns trigger
    language plpgsql as
$$
begin
    raise notice '%', age(current_timestamp, new.date_of_birth);
    return new;
end;
$$;

drop trigger insert_birthdate_trigger on lab7;
create or replace trigger insert_birthdate_trigger
    before insert on lab7
    for each row
execute function get_age();


--c
drop function compute_tax();
create function compute_tax()
    returns trigger
    language plpgsql as
$$ begin
    new.price = new.price * 1.12;
    return new;
end;
$$;

drop trigger insert_item_trigger on lab7;
create trigger insert_item_trigger
    before insert on lab7
    for each row
    execute function compute_tax();


--d
create function prevent_deletion()
returns trigger
language plpgsql as
    $$
begin
    raise exception 'Row is not deleted';
end;
$$;

create trigger do_not_delete_trigger
    before delete on lab7
    for each row
    execute function prevent_deletion();


--e
create function launch_d_e()
    returns trigger
    language plpgsql as
    $$
begin
    raise notice '%', check_pas(new.name);
    raise notice '%', if_divides_on_3and4(new.age);
    return new;
end;
$$;

create trigger launch_functions_trigger
    before insert on lab7
    for each row
    execute function launch_d_e();

insert into lab7(id, name, age) values(2, 'Sarah', 48);


--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ 3 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--a
drop function increase_salary(name varchar, age int, salary int, work_experience int);
create or replace function increase_salary(inout name varchar, inout age int, inout salary int, in work_experience int, out discount float)
language plpgsql as
    $$
declare
    cnt int := work_experience/2;
    cnt2 int := work_experience/5;
begin
    discount = 10;
    for loop_cnt in 1..cnt loop
        salary = salary * 1.1;
    end loop;
    for loop_cnt2 in 1..cnt2 loop
        discount = discount * 1.01;
    end loop;
end;
$$;
select * from increase_salary('Anna', 45, 34000, 10);


--b
create or replace function increase_salary_2(inout name varchar, inout age int, inout salary int, inout work_experience int, out discount int)
language plpgsql as
    $$
begin
    if age >= 40 then salary = salary * 1.15;
    end if;
    if work_experience > 8 then salary = salary * 1.15;
    end if;
    if work_experience > 8 then discount = 20;
    end if;
end;
$$;


select * from increase_salary_2('Mike', 34, 55000, 10);