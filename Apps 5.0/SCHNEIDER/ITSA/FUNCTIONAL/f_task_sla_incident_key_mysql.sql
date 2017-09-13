 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.incident_key' ELSE 'SUCCESS' END as Message 
 from schneider_mdwdb.f_task_sla stg
join schneider_mdsdb.slm_measurement_final src on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance
left join schneider_mdsdb.hpd_help_desk_final lkp on lkp.instanceid=src.applicationinstanceid and lkp.sourceinstance=src.sourceinstance
where incident_key <> case when src.applicationinstanceid is null then 'UNSPECIFIED' else coalesce(lkp.incident_number,'UNKNOWN')  end

