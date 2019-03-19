SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from cardinalhealth_mdsdb.sys_audit_final src 
JOIN cardinalhealth_mdwdb.f_rm_activity_c trgt 
oN 	 src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
join
cardinalhealth_mdwdb.d_task lkp
on COALESCE(src.documentkey,'UNSPECIFIED')=lkp.row_id
where coalesce(lkp.row_key,case when src.documentkey is null then 0 else -1 end) <> trgt.task_key)c