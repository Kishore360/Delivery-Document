

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.sys_user_group_final a
 left  JOIN  coach_mdwdb.d_internal_organization b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where  CASE WHEN organization_name LIKE 'TCS%' THEN 'Y' ELSE 'N' END <> b.tcs_c_flag)b
 
 