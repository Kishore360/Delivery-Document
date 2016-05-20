select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age_key' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.cmdb_ci_final S
left join #DWH_TABLE_SCHEMA.d_configuration_item T
on S.sys_id= T.row_id
left join #MDS_TABLE_SCHEMA.sys_user_final USR
on convert(USR.sys_id using utf8) = convert(S.managed_by using utf8)
where T.managed_by <> concat(concat(USR.first_name,' '),USR.last_name);