SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_rm_activity_c.task_attribute_wh_name' ELSE 'SUCCESS' END as Message
FROM (
select count(1) as cnt
from cardinalhealth_mdsdb.sys_audit_final src 
JOIN cardinalhealth_mdwdb.f_rm_activity_c trgt 
on 	 src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where src.tablename = 'rm_enhancement' AND 
src.fieldname <> trgt.task_attribute_wh_name) a