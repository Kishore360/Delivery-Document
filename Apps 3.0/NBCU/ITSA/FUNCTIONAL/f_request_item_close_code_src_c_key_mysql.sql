SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.f_request_item a11
left join nbcu_mdsdb.sc_req_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
left join nbcu_mdwdb.d_lov a13
on concat('CLOSE_CODE_C~SC_REQ_ITEM~~~',a12.u_close_code)=a13.row_id
where coalesce(a13.row_key, case when a12.u_close_code is Null  then 0 else -1 end )<>a11.close_code_src_c_key and a11.soft_deleted_flag='N')a
