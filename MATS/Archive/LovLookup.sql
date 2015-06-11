

select case when count(*) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 0 then CONCAT( CAST(COUNT(*) AS CHAR(10)), ' invalid #KEY_NAME set for #TABLE_NAME') 
else 'SUCCESS' end as Message
from (select D.*
from #TABLE_SCHEMA.#TABLE_NAME D
join #TABLE_SCHEMA.d_lov L
on D.#CODE_NAME = L.dimension_code
and dimension_class like '%#DIMENSION_CLASS%'
where #KEY_NAME <> L.row_key) A
