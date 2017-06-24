SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.sc_req_item_final b
left join intuit_mdwdb.f_request_item a 
 on b.sys_id=a.row_id and b.sourceinstance=a.source_id 
left join intuit_mdwdb.d_lov lkp
on lkp.row_id
=CONCAT('CONTACT_TYPE~SC_REQ_ITEM','~','','~','','~',b.contact_type)
where a.reported_type_src_c_key<>COALESCE(lkp.row_key,CASE WHEN b.contact_type IS NULL THEN 0 else -1 end) ) temp