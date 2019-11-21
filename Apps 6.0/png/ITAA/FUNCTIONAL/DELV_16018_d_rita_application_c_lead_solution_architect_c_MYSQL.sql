SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
(select count(1) as CNT
from
png_mdwdb.d_rita_application_c d_rita_application_c
join
png_mdsdb.pg_mega_cmdb_ci_appl_final cmdb_ci_appl
on (d_rita_application_c.row_id=cmdb_ci_appl.sys_id and d_rita_application_c.source_id=cmdb_ci_appl.sourceinstance)
join
png_mdwdb.d_rita_application_ext_c d_rita_application_ext_c
on (d_rita_application_ext_c.row_id=d_rita_application_c.row_id and d_rita_application_ext_c.source_id=d_rita_application_c.source_id)
join
png_mdwdb.f_rita_application_c f_rita_application_c
on (f_rita_application_c.row_id=d_rita_application_c.row_id and f_rita_application_c.source_id=d_rita_application_c.source_id)
join
png_mdwdb.d_internal_contact d_internal_contact
on ((COALESCE(CONCAT('INTERNAL_CONTACT~',cmdb_ci_appl.u_pg_soution_architect),'UNSPECIFIED'))=d_internal_contact.row_id and d_internal_contact.source_id=2)
where
d_rita_application_ext_c.lead_solution_architect_c<>COALESCE(d_internal_contact.full_name, 'UNSPECIFIED')
and cmdb_ci_appl.cdctype='X') temp;