SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
<<tenant>>_mdwdb.f_request_task f
JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN <<tenant>>_mdwdb.d_request_task a ON a.row_key = f.request_task_key
AND f.source_id = a.source_id
JOIN <<tenant>>_mdwdb.d_o_data_freshness df ON f.source_id = df.source_id
and df.lastupdated=(SELECT MAX(etl_run_number) AS lastupdated
FROM <<tenant>>_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')
where 
if(timestampdiff(second, CONVERT_TZ(a.opened_on,'America/Los_Angeles','GMT'), 
CONVERT_TZ(df.lastupdated,'America/Los_Angeles','GMT'))>0,
timestampdiff(second, CONVERT_TZ(a.opened_on,'America/Los_Angeles','GMT'), 
CONVERT_TZ(df.lastupdated,'America/Los_Angeles','GMT')),0) <> f.age)c