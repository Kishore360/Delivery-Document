 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.age' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt FROM (select * from mercuryinsurance_mdsdb.u_asc_ticket_final where opened_at < coalesce(u_resolved,closed_at)) SRC 
  join mercuryinsurance_mdwdb.f_incident_asc_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN mercuryinsurance_mdwdb.d_lov_map br ON f.asc_incident_state_c_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~INCIDENT'
JOIN mercuryinsurance_mdwdb.d_incident_asc_c a ON a.row_key = f.incident_asc_c_key
AND f.source_id = a.source_id 

WHERE TIMESTAMPDIFF(DAY,SRC.opened_at,(SELECT CONVERT_TZ(MAX(lastupdated),'America/Los_Angeles','GMT') AS lastupdated

FROM mercuryinsurance_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age

 )A