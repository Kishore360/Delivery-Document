SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdwdb.d_enhancement_rm_c d
JOIN cardinalhealth_mdsdb.rm_enhancement_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
 JOIN cardinalhealth_mdsdb.sc_req_item_final f ON i.u_requested_item=f.sys_id 
 JOIN cardinalhealth_mdsdb.sc_cat_item_final c ON f.cat_item=c.sys_id
where COALESCE(c.name,'Enhancements')<>d.item_type)c
