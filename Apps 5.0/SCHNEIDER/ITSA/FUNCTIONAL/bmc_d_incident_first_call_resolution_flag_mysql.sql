SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC 
JOIN schneider_mdwdb.d_incident di ON (SRC.entry_id = di.row_id AND SRC.sourceinstance = di.source_id AND SRC.sourceinstance = di.source_id )
 JOIN schneider_mdwdb.f_incident fi ON di.row_key = fi.incident_key
JOIN schneider_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  and dlm.dimension_class = 'STATE~INCIDENT'  
  JOIN (
			SELECT max(lastupdated) as lastupdated, 
				   source_id
			  FROM schneider_mdwdb.d_o_data_freshness
		group by source_id
	) df ON di.source_id = df.source_id 
where (case when timestampdiff(MINUTE,di.opened_on, df.lastupdated) < 30 and  dlm.dimension_wh_code = 'OPEN' then 'P' 
when TIMESTAMPDIFF(MINUTE,di.opened_on,coalesce(di.last_resolved_on,di.closed_on))<30 and dlm.dimension_wh_code IN('RESOLVED','CLOSED')   then 'Y'
else 'N'  end)  <>  di.first_call_resolution_flag;
