SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.rita_application_repository_type_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype<>'D'
LEFT JOIN png_mdwdb.d_lov LKP ON CASE 
WHEN SRC.u_pg_category='Non-Digital'  THEN 'OT_PA_REPOSITORY_TYPE_C~PROCESSING_ACTIVITIES~PAPER'  
WHEN SRC.u_pg_category IS NULL THEN 'UNSPECIFIED'  ELSE 'OT_PA_REPOSITORY_TYPE_C~PROCESSING_ACTIVITIES~DIGITAL' END =LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN upper(SRC.u_pg_category) IS NULL THEN 0 ELSE -1 END)<>TRGT.rita_application_repository_type_c_key 
) temp;


