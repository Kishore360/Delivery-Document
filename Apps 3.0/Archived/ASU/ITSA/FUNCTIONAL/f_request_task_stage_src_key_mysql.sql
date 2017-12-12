

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.sc_task_final r
left join asu_mdwdb.f_request_task  t
on r.sys_id=t.row_id and r.sourceinstance=t.source_id
left join asu_mdsdb.sc_req_item_final s
on r.request_item=s.sys_id and r.sourceinstance=s.sourceinstance
LEFT JOIN asu_mdwdb.d_lov LKP 
 ON ( concat('STAGE~SC_REQ_ITEM~~~',upper(s.stage))= LKP.row_id 
AND s.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN s.stage IS NULL THEN 0 else '-1' end)<> COALESCE(t.stage_src_key,'')
) temp