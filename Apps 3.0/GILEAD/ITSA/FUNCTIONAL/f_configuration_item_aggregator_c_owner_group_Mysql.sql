SELECT
CASE WHEN count(1) >0 THEN 'FAILUTE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN count(1) >0 THEN 'MDS to DWH Validation Failure' ELSE 'SUCCESS' END AS Message
FROM gilead_mdsdb.cmdb_ci_final SRC
JOIN gilead_mdsdb.cmdb_ci_service_final service on(SRC.sys_id = service.sys_id and SRC.sourceinstance = service.sourceinstance)
LEFT JOIN gilead_mdsdb.sys_user_group_final grp ON (grp.sys_id = service.support_group and grp.sourceinstance = service.sourceinstance)
JOIN gilead_mdwdb.f_configuration_item_aggregator_c TRGT ON (grp.name=SUBSTRING_INDEX( SUBSTRING_INDEX(TRGT.row_id,'~',3),'~',-1) and SRC.sourceinstance=TRGT.source_id)
WHERE aggregate_c_key not in ('20170116','20170123')
AND COALESCE(grp.name,'UNSPECIFIED')<>TRGT.owner_group