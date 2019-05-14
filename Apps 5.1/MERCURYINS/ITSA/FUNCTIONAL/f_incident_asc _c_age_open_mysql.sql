SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.notifind_sent_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_incident_asc_c f
JOIN mercuryins_mdwdb.d_lov_map br 
ON f.asc_incident_state_c_key = br.src_key AND br.dimension_wh_code = 'OPEN'
JOIN mercuryins_mdwdb.d_incident_asc_c a 
ON a.row_key = f.incident_asc_c_key AND f.source_id = a.source_id
JOIN (select df.source_id,max(df.lastupdated)as lastupdated from mercuryins_mdwdb.d_o_data_freshness df group by 1 )lkp
ON f.source_id = lkp.source_id
where f.age <> timestampdiff(DAY, a.opened_on, (lkp.lastupdated))
           

