SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from <<tenant>>_mdwdb.d_request TRGT
LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=TRGT.source_id and TRGT.etl_run_number=FRESH.etl_run_number
and sourcename like 'ServiceNow%') 
WHERE due_on is not  null and 
COALESCE( CASE WHEN TRGT.active_flag = 'Y' and TRGT.due_on < FRESH.lastupdated then 'Y' else 'N' END,'')<>
 COALESCE(TRGT.over_due_flag ,'')
)a