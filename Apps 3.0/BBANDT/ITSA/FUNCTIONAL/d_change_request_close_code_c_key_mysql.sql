SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from bbandt_mdsdb.change_request_final a
left JOIN bbandt_mdwdb.d_change_request b
on a.sys_id= b.row_id and a.sourceinstance=b.source_id
LEFT JOIN bbandt_mdwdb.d_lov LKP 
 ON ( concat('',u_close_code )= LKP.row_id 
AND a.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN a.u_close_code  IS NULL THEN 0 else -1 end)<>b.close_code_c_key)temp; 
