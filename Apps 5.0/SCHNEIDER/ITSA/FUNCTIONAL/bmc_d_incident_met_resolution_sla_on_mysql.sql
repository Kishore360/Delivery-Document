SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.met_response_sla_on' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC join schneider_mdwdb.f_task_sla f_latest
on (TRGT.row_key = f_latest.incident_key and f_latest.category='RESOLUTION'and f_latest.resp_strt_rank=1) and f_latest.stage in ('COMPLETED','ACHIEVED')
WHERE coalesce( f_latest.start_on ,  'UNSPECIFIED') <> TRGT.met_response_sla_on; 


