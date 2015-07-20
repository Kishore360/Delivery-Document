

select case when count(*) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(*) > 1 then CONCAT(count(*),' invalid dormant_flag set for dwh_f_incident' )else 'SUCCESS' end as Message
from (select * from #DWH_TABLE_SCHEMA.dwh_f_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)>0
and dormant_flag <> 'Y' 
union
select * from #DWH_TABLE_SCHEMA.dwh_f_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)< 0
and dormant_flag <> 'N'
) R

