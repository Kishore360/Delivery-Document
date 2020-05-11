

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_project.planview_project_department_c_key' ELSE 'SUCCESS' END as Message FROM (
SELECT  count(1) as CNT
FROM terex_mdsdb.pv_projects_final SRC 
LEFT JOIN terex_mdwdb.d_project TRGT ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join terex_mdwdb.d_internal_organization LKP
on LKP.row_id=coalesce(CONCAT('DEPARTMENT~',SRC.Department1),'UNSPECIFIED')
WHERE coalesce(case when SRC.Department1 is null then 0 else LKP.row_key end,-1)<> TRGT.planview_project_department_c_key
 AND SRC.cdctype='X' ) temp; 