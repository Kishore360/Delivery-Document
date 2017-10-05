SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC 
JOIN schneider_mdwdb.d_incident di ON (SRC.entry_id = di.row_id AND SRC.sourceinstance = di.source_id AND SRC.sourceinstance = di.source_id )
 JOIN schneider_mdwdb.f_incident fi ON di.row_key = fi.incident_key
JOIN schneider_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  and dlm.dimension_class = 'STATE~INCIDENT'   AND dlm.dimension_wh_code = 'OPEN'
  JOIN (
			SELECT max(lastupdated) as lastupdated, 
				   source_id
			  FROM schneider_mdwdb.d_o_data_freshness
		group by source_id
	) df ON di.source_id = df.source_id 
where (case when timestampdiff(DAY,di.changed_on, df.lastupdated) > 30 then 'Y' else 'N' end) <> di.dormant_flag;
