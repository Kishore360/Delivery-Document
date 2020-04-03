SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_incident.close_notes_c' ELSE 'SUCCESS' END as Message 
FROM(select count(1) as CNT from 
(select sys_id,sourceinstance, close_notes,cdctime  from aetna_mdsdb.incident_final where CDCTYPE<>'D') src
join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness group by source_id) f1 on
 (f1.source_id = b.sourceinstance) and  (src.cdctime<=f1.lastupdated)
JOIN  aetna_mdwdb.d_incident trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where src.close_notes <> trgt.close_notes_c )temp;