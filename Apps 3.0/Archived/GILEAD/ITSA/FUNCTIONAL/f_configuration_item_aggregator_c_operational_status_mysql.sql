

SELECT
CASE WHEN count(1) >0 THEN 'FAILUTE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN count(1) >0 THEN 'MDS to DWH Validation Failure' ELSE 'SUCCESS' END AS Message
FROM gilead_mdsdb.cmdb_ci_final SRC
LEFT join (select value,label from gilead_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'operational_status' and language = 'en' and label = 'Active' group by value) as op on (op.value = SRC.operational_status)
JOIN gilead_mdwdb.f_configuration_item_aggregator_c TRGT ON (op.label= SUBSTRING_INDEX( SUBSTRING_INDEX(TRGT.row_id,'~',5),'~',-1) and SRC.sourceinstance=TRGT.source_id)
WHERE aggregate_c_key not in ('20170116','20170123')
and COALESCE(op.label,'UNSPECIFIED')<>TRGT.operational_status