SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.d_task_c TGT
JOIN rei_mdsdb.task_final SRC
on TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance
LEFT JOIN rei_mdwdb.d_task_c lkp
ON SRC.parent = lkp.row_id and SRC.sourceinstance = lkp.source_id
where  coalesce(lkp.row_key,-1)<> TGT.parent_task_key)c