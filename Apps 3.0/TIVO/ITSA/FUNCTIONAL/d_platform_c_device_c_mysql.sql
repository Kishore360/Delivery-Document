 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from tivo_mdsdb.u_platform_final a
 left  JOIN   tivo_mdwdb.d_platform_c b
on  b.ROW_ID=a.sys_id and a.sourceinstance=b.source_id
 where a.u_device <> b.device_c) temp;
 
 