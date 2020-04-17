SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
from  gilead_mdsdb.cmdb_ci_final SRC
join gilead_mdwdb.d_configuration_item  TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where case when SRC.u_business_owner is null  then 'Y' else 'N' end <>TRGT.missing_business_process_owner_c_flag and SRC.cdctype='X'


