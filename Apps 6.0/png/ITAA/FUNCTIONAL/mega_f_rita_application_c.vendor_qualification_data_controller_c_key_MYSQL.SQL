SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.vendor_qualification_data_controller_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
from png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(
SELECT a.app_hexid,a.sourceinstance,CASE WHEN COUNT(distinct responsible_org_unit_hexid) <= 1 THEN MAX(COALESCE(a.responsible_org_unit_hexid,'UNSPECIFIED')) ELSE 'UNKNOWN' END AS 'responsible_org_unit_hexid'  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a where a.data_controller = 'Y' and cdctype <>'D'
GROUP BY app_hexid,sourceinstance
)DATA_VENDOR 
ON (SRC.NAME=DATA_VENDOR.app_hexid AND SRC.sourceinstance=DATA_VENDOR.sourceinstance AND SRC.cdctype <>'D' )
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_internal_organization LKP ON (DATA_VENDOR.responsible_org_unit_hexid=LKP.row_id AND DATA_VENDOR.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN (DATA_VENDOR.responsible_org_unit_hexid='UNSPECIFIED' OR 
DATA_VENDOR.responsible_org_unit_hexid IS NULL) THEN 0 ELSE -1 END )<>TRGT.vendor_qualification_data_controller_c_key
) temp;




