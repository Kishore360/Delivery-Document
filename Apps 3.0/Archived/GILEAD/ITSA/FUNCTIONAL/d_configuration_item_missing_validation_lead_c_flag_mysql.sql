SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
from  gilead_mdsdb.cmdb_ci_final
join gilead_mdwdb.d_configuration_item on sys_id=row_id and sourceinstance=source_id
where case when u_validation_lead is null  then 'Y' else 'N' end <>missing_validation_lead_c_flag;


