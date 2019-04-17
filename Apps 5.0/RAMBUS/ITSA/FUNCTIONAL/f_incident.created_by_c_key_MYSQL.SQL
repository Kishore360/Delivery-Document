SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.created_by_c_key' ELSE 'SUCCESS' END as Message
FROM (SELECT Count(1) as CNT 
FROM rambus_mdsdb.incident_final a
JOIN rambus_mdwdb.f_incident b ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
JOIN rambus_mdwdb.d_internal_contact c ON a.sys_created_by=c.user_name and a.sourceinstance=c.source_id and c.soft_deleted_flag ='N'
WHERE 
DATE_FORMAT(b.pivot_date, '%Y-%m-%d %H:%i:%s')
AND (b.pivot_date BETWEEN c.effective_from AND c.effective_to) 
AND b.soft_deleted_flag='N'
AND coalesce(c.row_key,CASE WHEN a.sys_created_by is NULL THEN 0 ELSE -1 END)<>b.created_by_c_key
)temp;

 