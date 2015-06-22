


select case when count(1) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 1 then CONCAT(count(1),' invalid dormant_flag set for f_incident' )else 'SUCCESS' end as Message
from (select 1 from <<tenant>>_mdwdb.d_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)>0
and dormant_flag <> 'Y' 
union
select 1 from <<tenant>>_mdwdb.d_incident
where TIMESTAMPDIFF(MONTH,changed_on, dw_inserted_on)< 0
and dormant_flag <> 'N'
) R



#success....but message is not displayed