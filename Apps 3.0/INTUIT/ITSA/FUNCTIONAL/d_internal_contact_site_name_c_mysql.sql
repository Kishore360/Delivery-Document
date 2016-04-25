SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
from intuit_mdwdb.d_internal_contact TRGT join 
intuit_mdsdb.sys_user_final SRC on TRGT.row_id = concat('INTERNAL_CONTACT~',SRC.sys_id )
and TRGT.source_id=SRC.sourceinstance 
where TRGT.site_name_c<>SRC.u_intuitusersitename
