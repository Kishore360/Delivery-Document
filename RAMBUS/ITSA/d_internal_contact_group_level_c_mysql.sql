
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

from(select count(1) as cnt

from rambus_mdwdb.d_internal_contact a 

left JOIN rambus_mdsdb.sys_user_final b 

ON a.row_id =concat('INTERNAL_CONTACT~',b.sys_id)  
where coalesce(a.group_level_c,'')<>coalesce(b.u_it_group_level,''))z;