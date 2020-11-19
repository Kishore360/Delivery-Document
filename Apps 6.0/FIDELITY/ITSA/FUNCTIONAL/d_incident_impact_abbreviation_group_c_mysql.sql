SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdwdb.d_incident d_incident   
INNER JOIN
fidelity_mdwdb.f_incident f_incident 
ON d_incident.row_key=f_incident.incident_key  
LEFT OUTER JOIN
fidelity_mdwdb.d_lov d_lov 
ON f_incident.urgency_src_key=d_lov.row_key  
LEFT OUTER JOIN
fidelity_mdwdb.d_lov d_lov1 
ON f_incident.impact_src_key=d_lov1.row_key  
LEFT OUTER JOIN
fidelity_mdwdb.d_lov d_lov2 
ON d_incident.impacted_audience_src_c_key=d_lov2.row_key  
where
d_incident.impact_abbreviation_group_c <> concat(trim(SUBSTRING_INDEX(d_lov1.dimension_name,'-',1)) ,(SUBSTRING(SUBSTRING_INDEX(d_lov.dimension_name,'-',-1),2,1)),( case when d_lov2.dimension_name in ('Both', 'External', 'Internal') then ' BI'  else ' Non BI' end))
   