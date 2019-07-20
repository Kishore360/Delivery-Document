

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from  png_mdsdb.cmn_location_final a
left JOIN png_mdwdb.d_location b
on  a.parent = b.ROW_ID and a.sourceinstance=b.source_id
  JOIN  png_mdwdb.d_location c
on a.sys_id= c.row_id and a.sourceinstance=c.source_id
where 
COALESCE(b.row_key,CASE WHEN parent IS NULL THEN 0 ELSE -1 END ) <> c.parent_location_c_key )b





