-- If Failed might be Sequencing Ordering issues 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.pii_handled_for_specific_bp' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT
from png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(SELECT a.app_hexid,a.sourceinstance,GROUP_CONCAT(distinct a.pii_handled_for_specific_bp ORDER BY pii_handled_for_specific_bp desc) AS pii_handled_for_specific_bp
FROM
png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a where (a.app_hexid IS NOT NULL AND a.pii_handled_for_specific_bp IS NOT NULL AND a.cdctype='X')
group by a.app_hexid
) SRC1 ON SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON SRC.Name=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.pii_handled_for_specific_bp,'UNSPECIFIED')<>TRGT.pii_data_handled_for_specific_bp
AND SRC.cdctype='X'
) temp;



