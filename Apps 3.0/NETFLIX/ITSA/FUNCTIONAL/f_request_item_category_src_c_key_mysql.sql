SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  netflix_mdwdb.f_request_item a11
 join netflix_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
left join netflix_mdwdb.d_lov a13
on trim(concat('CATEGORY~SC_REQ_ITEM~~~',UPPER(a12.u_category)))=a13.row_id
where coalesce(a13.row_key, case when a12.u_category is Null  then 0 else -1 end )<>a11.category_src_c_key)b;