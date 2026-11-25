-- Write your query below

select
    first_name,
    last_name,
    city,
    state
from 
    person a
full join
    address b
on
    a.person_id = b.person_id
where
    a.person_id is not null