select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age_key' ELSE 'SUCCESS' END as Message
from wow_mdsdb.cmdb_ci_final S
left join wow_mdwdb.d_configuration_item T
on S.sys_id= T.row_id
left join wow_mdsdb.sys_user_final USR
on (USR.sys_id ) = (S.managed_by )
where T.managed_by <> concat(concat(USR.first_name,' '),USR.last_name);