SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM equifax_mdwdb.d_equifax_bu_equifax_business_impact_c a join
equifax_mdwdb.f_incident b on a.incident_number_c=b.row_id and a.source_id=b.source_id
where a.inicdent_priority_high_flag_c<> case when b.priority_src_code in (1,2) then 'Y' else 'N' end)b 

