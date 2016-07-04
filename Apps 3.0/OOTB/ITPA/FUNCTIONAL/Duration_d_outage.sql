SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Duration validation failed for d_outage' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.d_outage
where duration not in
(
select case when duration is not null then 
case when '1970-01-01 00:00:00'<= duration 
then timestampdiff(SECOND,'1970-01-01 00:00:00',duration)
else 0 end
else null end as duration
from <<tenant>>_mdsdb.cmdb_ci_outage_final);
