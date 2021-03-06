SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.f_request_task TGT
JOIN rei_mdsdb.sc_task_final SRC
on TGT.row_id = SRC.sys_id
JOIN rei_mdwdb.d_lov_map br ON TGT.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
AND TGT.source_id = SRC.sourceinstance
JOIN rei_mdwdb.d_calendar_date lkp
ON  COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') = lkp.row_id
where  COALESCE(lkp.row_key,case when SRC.closed_at is null then 0 else -1 end ) <>TGT.closed_on_key)c