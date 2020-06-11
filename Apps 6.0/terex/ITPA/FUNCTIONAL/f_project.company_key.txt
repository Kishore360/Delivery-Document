

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_project.company_key' ELSE 'SUCCESS' END as Message FROM (
SELECT COUNT(1) AS CNT
FROM terex_mdsdb.pv_projects_final SRC 
JOIN terex_mdwdb.f_project TRGT ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
join terex_mdwdb.d_internal_organization LKP
on LKP.row_id=COALESCE(CONCAT('SUBSIDIARY~',SRC.Enterprise1),'UNSPECIFIED') and LKP.source_id=SRC.sourceinstance
WHERE coalesce(case when SRC.Enterprise1 is null then 0 else LKP.row_key end,-1)<>TRGT.company_key
 AND SRC.cdctype='X' ) temp; 