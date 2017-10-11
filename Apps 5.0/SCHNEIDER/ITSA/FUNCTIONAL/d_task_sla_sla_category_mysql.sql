SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_category' ELSE 'SUCCESS' END as Message 
FROM    schneider_mdsdb.slm_servicetarget_final SRC
JOIN  schneider_mdwdb.d_task_sla TRGT 
on SRC.instanceid=TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
where case 
                when lower(SRC.title) like '%resolution%' then  'Resolution'  
                when  lower(SRC.title) like '%response%' then 'Response' 
                ELSE NULL 
            END <>COALESCE(TRGT.sla_category,'UNSPECIFIED');
			
			