SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt
from wow_mdwdb.d_internal_contact a
left join wow_mdsdb.sys_user_final b
on a.row_id=CONCAT('INTERNAL_CONTACT~',b.sys_id) 
and a.source_id=b.sourceinstance
where a.start_date_c<>CONVERT_TZ(b.u_start_date,'GMT','US/Central')) a
;