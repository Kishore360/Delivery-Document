SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 
 CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.failure_flag' ELSE 'SUCCESS' END AS Message
FROM (SELECT count(1) as CNT
FROM   truist_mdsdb.cmdb_ci_outage_final SRC 
JOIN truist_mdwdb.f_outage TRGT 
ON ( SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )

WHERE   if (SRC.duration is not null ,  (if (timestampdiff(SECOND, '1970-01-01 00:00:00', SRC.duration)>=0,timestampdiff(SECOND,'1970-01-01 00:00:00',SRC.duration),NULL   )),NULL)<>TRGT.outage_duration)a
