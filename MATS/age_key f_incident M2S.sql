select case when count(1) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 1 then CONCAT( CAST(COUNT(1) AS CHAR(10)), ' invalid aging_key set for f_incident') 
else 'SUCCESS' end as Message from(
select count(1) from
(
select i.row_id,i.age,c.lower_range_value,c.upper_range_value,i.age_key,c.row_key
from <<tenant>>_mdwdb.f_incident i
left join <<tenant>>_mdwdb.d_lov c
on c.dimension_class='AGEBUCKET_WH~INCIDENT'
where  i.age between c.lower_range_value and c.upper_range_value
and i.age_key<>c.row_key
)h
)e