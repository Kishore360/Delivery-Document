SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from cardinalhealth_mdsdb.rm_enhancement_final a
 join cardinalhealth_mdwdb.f_enhancement_rm b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
   join cardinalhealth_mdwdb.d_lov c 
on  (CONCAT('TYPE_OF_REQUEST_C~RM_ENHANCEMENT~~~',a.u_type_of_request)=c.src_rowid AND a.sourceinstance= c.source_id )
 where COALESCE(c.row_key,CASE WHEN a.u_type_of_request IS NULL THEN 0 else -1 end)<> b.type_of_request_c_key)g ;