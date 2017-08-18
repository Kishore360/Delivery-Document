SELECT
CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT>0 THEN 'MDS TO DWS Validation Failed for f_outage_c.caused_by_change_Key' ELSE 'SUCCESS' END AS MESSAGE
FROM 
(SELECT COUNT(1) as CNT
FROM intuit_mdsdb.cmdb_ci_outage_final SRC
JOIN intuit_mdsdb.incident_final SRC1 ON (SRC.task_number=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance)
JOIN intuit_mdwdb.d_outage TRGT ON (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
WHERE IF(SRC1.caused_by is not null, 'Y', 'N') <> TRGT.caused_by_change_flag )temp 
