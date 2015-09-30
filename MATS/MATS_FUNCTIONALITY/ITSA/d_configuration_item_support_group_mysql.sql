SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
FROM <<tenant>>_mdsdb.cmdb_ci_final S
left join <<tenant>>_mdsdb.sys_user_final SYG
on (SYF.sys_id = S.assigned_to )
left join  <<tenant>>_mdwdb.d_configuration_item t
 on S.sys_id = t.row_id and S.sourceinstance =t.source_id
where coalesce(t.support_group,'') <> coalesce(SYG.name,'');