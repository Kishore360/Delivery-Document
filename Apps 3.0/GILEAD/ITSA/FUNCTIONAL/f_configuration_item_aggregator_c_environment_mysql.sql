
SELECT
CASE WHEN count(1) >0 THEN 'FAILUTE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN count(1) >0 THEN 'MDS to DWH Validation Failure' ELSE 'SUCCESS' END AS Message
FROM gilead_mdsdb.cmdb_ci_final SRC
LEFT join( select value,label from gilead_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'u_environment' and language = 'en'  group by value) env on env.value = SRC.u_environment
JOIN gilead_mdwdb.f_configuration_item_aggregator_c TRGT ON (env.label= SUBSTRING_INDEX( SUBSTRING_INDEX(TRGT.row_id,'~',2),'~',-1) and SRC.sourceinstance=TRGT.source_id)
WHERE aggregate_c_key not in ('20170116','20170123')
AND COALESCE(env.label,'UNSPECIFIED')<>TRGT.environment