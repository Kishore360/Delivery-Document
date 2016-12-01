SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  netflix_mdwdb.f_request_item a11
left join netflix_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
where a12.u_category<>a11.category_src_code_c)a
