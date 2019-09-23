SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_sla_analysis_c.business_duration' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt 
from(select sys_id, sourceinstance,cdctime from mcdonalds_mdsdb.task_final) src 
 join (select sys_id, sourceinstance,cdctime from mcdonalds_mdsdb.incident_final) src1 on src.sys_id=src1.sys_id and src.sourceinstance=src1.sourceinstance
 left join (select sys_id, sourceinstance, cdctime, business_duration, task, sla from mcdonalds_mdsdb.task_sla_final) src2 on src.sys_id = src2.task and src.sourceinstance=src2.sourceinstance
 Left join mcdonalds_mdwdb.f_sla_analysis_c  trgt 
 on CONCAT(src2.task,'~',COALESCE(src2.sla,'UNSPECIFIED'),'~',COALESCE(src2.sys_id,'UNSPECIFIED'))=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src2.cdctime<=f1.lastupdated) 
 and CASE WHEN src2.business_duration is null  THEN NULL   
     WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src2.business_duration) < 0 THEN NULL    
     WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src2.business_duration) > 214748364 THEN NULL     
     ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src2.business_duration) END  <> trgt.business_duration) temp;