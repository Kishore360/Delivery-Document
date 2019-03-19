 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.sc_task_final a
JOIN  cardinalhealth_mdwdb.f_request_task b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdsdb.sc_req_item_final f 
ON a.request_item=f.sys_id 	AND a.sourceinstance=f.sourceinstance
join cardinalhealth_mdwdb.d_master_item lkp
on COALESCE(f.cat_item,'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when f.cat_item is null then 0 else -1 end)<> b.catalog_item_rt_c_key)c

