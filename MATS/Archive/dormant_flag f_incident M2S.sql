


select case when count(*) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 1 then CONCAT(count(*),' invalid dormant_flag set for f_incident' )else 'SUCCESS' end as Message
from (select * from #TABLE_SCHEMA.f_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)>0
and dormant_flag <> 'Y' 
union
select * from #TABLE_SCHEMA.f_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)< 0
and dormant_flag <> 'N'
) R

