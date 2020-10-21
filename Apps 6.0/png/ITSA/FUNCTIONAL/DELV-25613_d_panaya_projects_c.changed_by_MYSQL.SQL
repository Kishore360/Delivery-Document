SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_panaya_projects_c.changed_by' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
From png_mdsdb.u_pg_panaya_projects_final SRC 
LEFT JOIN png_mdwdb.d_panaya_projects_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.sys_updated_by,'UNSPECIFIED')<>TRGT.changed_by
AND SRC.cdctype='X'
)temp;










