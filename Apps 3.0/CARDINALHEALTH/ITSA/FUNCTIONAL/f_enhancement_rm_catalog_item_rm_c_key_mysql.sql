 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.rm_enhancement_final a
JOIN  cardinalhealth_mdwdb.f_enhancement_rm b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdsdb.sc_req_item_final ref
on a.u_requested_item=ref.sys_id
join cardinalhealth_mdwdb.d_master_item lkp
on COALESCE(ref.cat_item,'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when ref.cat_item is null then 0 else -1 end)<> b.catalog_item_rm_c_key)c

