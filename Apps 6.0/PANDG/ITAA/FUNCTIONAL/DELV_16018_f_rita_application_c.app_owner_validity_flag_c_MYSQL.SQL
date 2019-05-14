SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.app_owner_validity_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(
SELECT ASSET_OWNER.app_hexid,ASSET_OWNER.sourceinstance,Employee_Type,CASE WHEN USR.user_name IS NOT NULL THEN 'Y' ELSE 'N' END AS App_Owner_Validity_Flag,user_name
FROM 
(
SELECT a.app_hexid,a.sourceinstance,
CASE WHEN COUNT(distinct a.person_hex) <= 1 THEN COALESCE(MAX(a.person_hex),'UNSPECIFIED') ELSE 'UNKNOWN' END AS 'person_hex',
CASE WHEN COUNT(distinct a.person_hex) <= 1 THEN COALESCE(MAX(a.person_intranet_id),'UNSPECIFIED') ELSE 'UNKNOWN' END AS 'person_intranet_id'
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a  WHERE a.application_manager = 'Y' AND a.cdctype<>'D'
group by a.app_hexid,a.sourceinstance
) ASSET_OWNER
LEFT JOIN 
(Select user_name,MAX(u_employee_type) AS Employee_Type
FROM  png_mdsdb.sys_user_final where user_name IS NOT NULL AND u_employee_type='Employee' AND active =1 AND cdctype<>'D' group by 1) USR
ON ASSET_OWNER.person_intranet_id=USR.user_name
) SRC1 ON SRC.NAME=SRC1.app_hexid AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE SRC1.App_Owner_Validity_Flag<>TRGT.app_owner_validity_flag_c
AND SRC.cdctype<>'D'
) temp;




