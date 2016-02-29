SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  tivo_mdwdb.f_request_item a11
left join tivo_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
left join tivo_mdwdb.d_internal_contact a13
on concat('INTERNAL_CONTACT~',u_request_for)=a13.row_id
where a13.row_key<>a11.request_for_src_c_key)a
