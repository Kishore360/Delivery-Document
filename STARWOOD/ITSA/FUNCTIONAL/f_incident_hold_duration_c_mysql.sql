
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
 ,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
 ELSE 'Data Matched' END AS Message 
 FROM
starwood_mdwdb.f_incident TGT
JOIN starwood_mdsdb.incident_final SRC
ON TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance where
TGT.hold_duration_c <> timestampdiff(SECOND,'1970-01-01 00:00:00',SRC.u_hold_duration)

