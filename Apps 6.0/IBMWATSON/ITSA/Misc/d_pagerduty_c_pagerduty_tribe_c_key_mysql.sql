SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_task.u_target_type_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.x_pd_integration_additional_pagerduty_final src
left join  ibmwatson_mdsdb.cmdb_ci_final a on src.cmdb_ci.sys_id and src.sourceinstance=2
left join ibmwatson_mdwdb.d_tribe_c d on a.u_tribe=d.row_id and a.sourceinstance=d.source_id and a.cdctype<>'D'
 join ibmwatson_mdwdb.d_pagerduty_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where COALESCE(d.row_key,case when u_tribe is null then 0 else -1 end )<>trgt.pagerduty_tribe_c_key )ma
 
 