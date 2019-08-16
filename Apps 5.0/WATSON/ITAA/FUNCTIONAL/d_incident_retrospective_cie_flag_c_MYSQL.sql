SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.retrospective_cie_flag_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.incident_final src
 left join watson_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where case when src.u_disruption_ended is null then 'Y' 
when src.opened_at>src.u_disruption_ended then 'Y' else 'N' end <>trgt.retrospective_cie_flag_c )ma