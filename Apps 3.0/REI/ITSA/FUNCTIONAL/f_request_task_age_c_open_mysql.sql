SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.f_request_task f
JOIN rei_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
JOIN rei_mdwdb.d_request_task a ON a.row_key = f.request_task_key
AND f.source_id = a.source_id
JOIN rei_mdwdb.d_o_data_freshness df ON f.source_id = df.source_id
where 
if(timestampdiff(second, CONVERT_TZ(a.opened_on,'GMT','America/Los_Angeles'), 
CONVERT_TZ(df.lastupdated,'GMT','America/Los_Angeles'))>0,
timestampdiff(second, CONVERT_TZ(a.opened_on,'GMT','America/Los_Angeles'), 
CONVERT_TZ(df.lastupdated,'GMT','America/Los_Angeles')),0) <> f.age_c)c