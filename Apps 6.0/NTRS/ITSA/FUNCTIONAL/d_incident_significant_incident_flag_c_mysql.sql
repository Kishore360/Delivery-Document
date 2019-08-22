SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
ntrs_mdwdb.d_incident TRGT
JOIN 	ntrs_mdsdb.incident_final incident
ON   	incident.sys_id				=		TRGT.row_id and TRGT.source_id 		= incident.sourceinstance
JOIN 	ntrs_mdwdb.d_lov_map 
ON 		d_lov_map.dimension_class 	= 'STATE~INCIDENT' 
AND 	d_lov_map.dimension_code 	= incident.state 
AND 	d_lov_map.source_id 		= incident.sourceinstance
where 	significant_incident_flag_c   <> CASE  WHEN dimension_wh_code NOT in ('CANCELED' ) AND incident.u_incident_assessment =1 THEN  'Y' ELSE 'N' END )a;
