SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_task_tag_c.pivot_date ' ELSE 'SUCCESS' END as Message
from (SELECT Count(1) as cnt
FROM ibmwatson_mdsdb.label_entry_final src 
LEFT JOIN ibmwatson_mdwdb.f_task_tag_c trgt ON src.sys_id=trgt.row_id AND src.sourceinstance=trgt.source_id
where src.sys_created_on<>trgt.pivot_date)ma