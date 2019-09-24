SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for f_outage.outage_duration' ELSE 'SUCCESS' END as Message
 FROM rogers6_mdsdb.cmdb_ci_outage_final  SRC  
JOIN rogers6_mdwdb.f_outage TRGT 
ON SRC.sys_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  if (SRC.duration is not null ,(if (timestampdiff(SECOND,'1970-01-01 00:00:00',SRC.duration)>=0,
timestampdiff(SECOND,'1970-01-01 00:00:00',SRC.duration),NULL)),NULL) <>TRGT.outage_duration
and SRC.CDCTYPE='X';