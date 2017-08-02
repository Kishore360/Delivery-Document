SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.changed_on' ELSE 'SUCCESS' END as Message
  FROM(
select f.days_until_due_date_c TRGT, 
case when CONVERT_TZ(dat.lastupdated,'America/Los_Angeles','GMT') <= CONVERT_TZ(f.due_on,'America/Los_Angeles','GMT') then timestampdiff(day, CONVERT_TZ(dat.lastupdated,'America/Los_Angeles','GMT'),CONVERT_TZ(f.due_on,'America/Los_Angeles','GMT')) else null end SRC
from molinahealth_mdwdb.f_task_sla f
join (select max(lastupdated) as lastupdated,source_id,etl_run_number from molinahealth_mdwdb.d_o_data_freshness group by source_id) dat on f.source_id = dat.source_id  
WHERE CONVERT_TZ(dat.lastupdated,'America/Los_Angeles','GMT') <= CONVERT_TZ(f.due_on,'America/Los_Angeles','GMT') )ABC
WHERE SRC<>TRGT


