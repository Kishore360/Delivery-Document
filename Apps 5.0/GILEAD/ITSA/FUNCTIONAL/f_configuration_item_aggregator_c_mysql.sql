
SELECT
CASE WHEN count(1) >0 THEN 'FAILUTE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN count(1) >0 THEN 'MDS to DWH Validation Failure' ELSE 'SUCCESS' END AS Message
FROM gilead_mdsdb.cmdb_ci_final SRC
LEFT JOIN gilead_mdsdb.cmn_location_final cmn on (cmn.sys_id=SRC.location and cmn.SourceInstance=SRC.SourceInstance)
JOIN gilead_mdwdb.f_configuration_item_aggregator_c TRGT ON (cmn.name= SUBSTRING_INDEX( SUBSTRING_INDEX(TRGT.row_id,'~',4),'~',-1)
 and SRC.sourceinstance=TRGT.source_id)
WHERE aggregate_c_key not in ('20170116','20170123')
AND COALESCE(cmn.name,'UNSPECIFIED')<>TRGT.location
