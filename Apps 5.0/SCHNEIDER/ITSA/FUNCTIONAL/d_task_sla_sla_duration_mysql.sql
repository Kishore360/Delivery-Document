SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_duration' ELSE 'SUCCESS' END as Message 
FROM    schneider_mdsdb.slm_servicetarget_final SRC
JOIN  schneider_mdwdb.d_task_sla TRGT 
on SRC.instanceid=TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE (
  CASE 
                WHEN ((SRC.targethours*60)+SRC.targetminutes)*60 is null THEN NULL  
                WHEN (((SRC.targethours*60)+SRC.targetminutes)*60) < 0 THEN NULL 
                WHEN (((SRC.targethours*60)+SRC.targetminutes)*60) > 214748364 THEN NULL   
                ELSE ((SRC.targethours*60)+(SRC.targetminutes))*60 
            end ) <> TRGT.sla_duration;
			
			