

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.application_pg_asset_owner_department_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
select 
count(1) as CNT
from png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
JOIN png_mdsdb.sys_user_final SRC1 ON SRC.owned_by=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
join png_mdwdb.f_rita_application_c TRGT on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
join png_mdwdb.d_internal_organization LKP ON (COALESCE(CONCAT('DEPARTMENT~', SRC1.department),'UNSPECIFIED')=LKP.row_id and LKP.source_id=2)
WHERE 
COALESCE(LKP.row_key,CASE WHEN SRC1.department ='UNSPECIFIED' or SRC1.department is NULL THEN 0 ELSE -1 END )<>TRGT.application_pg_asset_owner_department_c_key
and SRC.cdctype='X'
) temp;


