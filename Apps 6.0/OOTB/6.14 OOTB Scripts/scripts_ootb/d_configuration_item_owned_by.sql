select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age_key' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_configuration_item T
on S.sys_id= T.row_id
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') USR
on USR.sys_id  = S.owned_by 
where T.owned_by <> concat(concat(USR.first_name,' '),USR.last_name);
