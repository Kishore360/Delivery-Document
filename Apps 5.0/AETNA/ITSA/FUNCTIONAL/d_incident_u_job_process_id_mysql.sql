SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
(
 SELECT Count(1) as CNT 
 FROM aetna_mdsdb.incident_final SRC 
 join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness where source_id=2 group by source_id) f1 on
 (f1.source_id = SRC.sourceinstance) AND  (SRC.cdctime<=f1.lastupdated) and SRC.cdctype<>'D'
 JOIN aetna_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id   )
 WHERE SRC.u_job_process_id <> TRGT.u_job_process_id 
 
 ) temp;
 