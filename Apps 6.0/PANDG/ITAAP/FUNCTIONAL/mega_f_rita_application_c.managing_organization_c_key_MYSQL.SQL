SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.managing_organization_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
from png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,
CASE WHEN COUNT(1) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 'UNKNOWN' END AS responsible_org_unit_hexid  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a WHERE a.pg_development_org = 'Y' AND a.cdctype<>'D'
 GROUP BY a.app_hexid,a.sourceinstance
) SRC1 ON (SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance )
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype<>'D'
JOIN png_mdwdb.d_internal_organization LKP ON (SRC1.responsible_org_unit_hexid=LKP.row_id AND SRC1.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.responsible_org_unit_hexid IS NULL THEN 0 ELSE -1 END )<>TRGT.managing_organization_c_key
) temp;






