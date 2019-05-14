select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.age' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt FROM 
 mercuryins_mdsdb.u_asc_ticket_final  SRC 
  join mercuryins_mdwdb.f_incident_asc_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )
join mercuryins_mdwdb.d_incident_asc_c d ON (f.incident_asc_c_key=d.row_key and f.soft_deleted_flag='N' )
JOIN mercuryins_mdwdb.d_lov_map br ON f.asc_incident_state_c_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~ASC_INCIDENT'
WHERE TIMESTAMPDIFF(second,d.opened_on,(SELECT MAX(lastupdated)
FROM mercuryins_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')
)<> f.age

 )A