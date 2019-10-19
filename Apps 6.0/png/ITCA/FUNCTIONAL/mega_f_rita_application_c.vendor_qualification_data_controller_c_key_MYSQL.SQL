/* SELECT 
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
) temp; */

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.vendor_qualification_data_controller_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
(
(select
d_ci_responsible_vendor_c.rita_application_c_key as row_key,
group_concat( distinct CASE 
WHEN d_ci_responsible_vendor_c.role_c='Data Controller' THEN d_internal_organization.row_key 
else '' END order by 1 asc ) AS vendor_qualification_data_controller
from
png_mdwdb.d_ci_responsible_vendor_c d_ci_responsible_vendor_c      
INNER JOIN
png_mdwdb.d_internal_organization d_internal_organization 
ON d_ci_responsible_vendor_c.company_ci_responsible_vendor_c_key = d_internal_organization.row_key  
GROUP BY
d_ci_responsible_vendor_c.rita_application_c_key) a
join
png_mdwdb.f_rita_application_c b
on  b.rita_application_c_key = a.row_key
join
png_mdwdb.d_rita_application_c c
on b.rita_application_c_key=c.row_key
join
png_mdsdb.pg_mega_cmdb_ci_appl_final d
on c.row_id=d.sys_id and c.source_id=d.sourceinstance)
where
b.vendor_qualification_data_controller_c_key<>
CAST(CASE 
WHEN a.vendor_qualification_data_controller like '%,%' THEN -1 
ELSE a.vendor_qualification_data_controller 
END AS SIGNED) and b.soft_deleted_flag='N' and d.cdctype='X'
) temp;



