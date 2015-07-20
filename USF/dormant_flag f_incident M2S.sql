

select case when count(1) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 1 then CONCAT(count(1),' invalid dormant_flag set for dwh_f_incident' )else 'SUCCESS' end as Message
from (select 1 from usf_mdwdb.dwh_f_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)>0
and dormant_flag <> 'Y' 
union
select 1 from usf_mdwdb.dwh_f_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)< 0
and dormant_flag <> 'N'
) R

