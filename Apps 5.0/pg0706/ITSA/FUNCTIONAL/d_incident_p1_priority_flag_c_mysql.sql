
SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) > 0 THEN 'MDS to DWH data validation failed for d_incident.p1_priority_flag_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT trgt.row_id,src.documentkey,trgt.p1_priority_flag_c , src.count_check,CASE WHEN src.count_check >=1 THEN 'Y' ELSE 'N' END
FROM png_mdwdb.d_incident trgt
LEFT JOIN(SELECT count(1) as count_check ,documentkey, sourceinstance 
from png_mds_viewdb.sys_audit_final 
where tablename = 'incident' and fieldname ='priority' and (COALESCE(newvalue,0) = 1 OR COALESCE(oldvalue,0) = 1)
group by documentkey,sourceinstance) src ON  trgt.row_id = src.documentkey AND trgt.source_id = src.sourceinstance

WHERE CASE WHEN src.count_check >=1 THEN 'Y' ELSE 'N' END <> trgt.p1_priority_flag_c 
AND trgt.soft_deleted_flag ='N'
)
temp;
