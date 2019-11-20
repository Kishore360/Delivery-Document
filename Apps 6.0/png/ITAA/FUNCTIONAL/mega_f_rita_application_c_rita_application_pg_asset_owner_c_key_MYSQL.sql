/* SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.rita_application_pg_asset_owner_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(
SELECT a.app_hexid,a.sourceinstance,CASE WHEN COUNT(distinct a.person_hex) <= 1 THEN MAX(COALESCE(a.person_hex,'UNSPECIFIED')) ELSE 'UNKNOWN' END AS 'person_hex'  
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a  WHERE a.application_manager = 'Y' AND a.cdctype<>'D'
group by a.app_hexid
) ASSET_OWNER ON SRC.NAME=ASSET_OWNER.app_hexid AND SRC.sourceinstance=ASSET_OWNER.sourceinstance
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id 
LEFT JOIN png_mdwdb.d_internal_contact LKP ON ASSET_OWNER.person_hex=LKP.row_id AND ASSET_OWNER.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN ASSET_OWNER.person_hex ='UNSPECIFIED' or ASSET_OWNER.person_hex is NULL  THEN 0 ELSE -1 END )<>TRGT.rita_application_pg_asset_owner_c_key
AND SRC.cdctype='X'
) temp;



 */
  
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
FROM
(select count(1) as CNT
from 
png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
join
png_mdwdb.f_rita_application_c TRGT
on (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
join
png_mdwdb.d_internal_contact LKP
on (COALESCE(CONCAT('INTERNAL_CONTACT~', SRC.owned_by),'UNSPECIFIED')=LKP.row_id and LKP.source_id=2)
where
COALESCE(LKP.row_key,CASE WHEN SRC.owned_by ='UNSPECIFIED' or SRC.owned_by is NULL THEN 0 ELSE -1 END )<>TRGT.rita_application_pg_asset_owner_c_key
and SRC.cdctype='X') temp;



