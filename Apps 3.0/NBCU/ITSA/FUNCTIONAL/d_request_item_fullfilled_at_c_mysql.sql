SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdsdb.sc_req_item_final a12
left join nbcu_mdwdb.d_request_item a11
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
<<<<<<< HEAD
where coalesce(convert_tz(a12.u_fulfilled_at,'GMT','America/New_York'),-99)<>coalesce(fulfilled_on_c,-99) and a11.soft_deleted_flag='N'
)a 
=======
where convert_tz(a12.u_fulfilled_at,'GMT','America/New_York')<>a11.fulfilled_on_c
)a
>>>>>>> 09cb2b799c2c24fd808a01b0114af78ce432499f
