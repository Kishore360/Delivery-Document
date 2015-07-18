
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then CONCAT( CAST(COUNT(1) AS CHAR(10)), ' invalid #KEY_NAME set for #DWH_TABLE_NAME') 
else 'SUCCESS' end as Message
from (select D.1
from <<tenant>>_mdwdb.#DWH_TABLE_NAME D
join <<tenant>>_mdwdb.dwh_d_lov L
on D.#CODE_NAME = L.dimension_code
and dimension_class like '%#DIMENSION_CLASS%'
where #KEY_NAME <> L.row_key) A
