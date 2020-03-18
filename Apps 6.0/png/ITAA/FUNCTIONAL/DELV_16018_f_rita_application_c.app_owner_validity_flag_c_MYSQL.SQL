SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.app_owner_validity_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
png_mdsdb.pg_mega_cmdb_ci_appl_final cmdb_ci_appl
JOIN 
png_mdwdb.d_rita_application_ext_c d_rita_application_ext_c
on (d_rita_application_ext_c.row_id=cmdb_ci_appl.sys_id and d_rita_application_ext_c.source_id=cmdb_ci_appl.sourceinstance)
join
png_mdwdb.d_internal_contact d_internal_contact_asset
on ((COALESCE(CONCAT('INTERNAL_CONTACT~',cmdb_ci_appl.owned_by),'UNSPECIFIED'))=d_internal_contact_asset.row_id and d_internal_contact_asset.source_id=2)
where
d_rita_application_ext_c.app_owner_validity_flag_c<>case 
when d_internal_contact_asset.row_key >0 
and d_internal_contact_asset.employee_type_c ='Employee' 
and d_internal_contact_asset.contact_active_flag ='Y' THEN 'Y' 
ELSE 'N' END
and cmdb_ci_appl.cdctype='X';
) temp;


-- Failed need to apply the below logic 
-- DELV-22495-- P&G: Recognize applications that are with a subsidiary owner as valid
/* 
select CASE WHEN (SRC1.u_employee_type='Employee'
AND SRC1.active='1')
OR (SRC2.notes like '#subsidiary') THEN 'Y' ELSE 'N' END AS App_Owner,count(1) as CNT
from
png_mdsdb.pg_mega_cmdb_ci_appl_final SRC
LEFT JOIN png_mdsdb.sys_user_final SRC1 ON SRC.owned_by=SRC1.sys_id 
LEFT JOIN png_mdsdb.core_company_final SRC2 ON SRC1.company=SRC2.sys_id
WHERE SRC.sys_class_name='cmdb_ci_appl' AND SRC.install_status NOT IN ('14','111') 
AND SRC.u_pg_category IN ('application','application_platform')
AND SRC.cdctype='X'
group by 1; */