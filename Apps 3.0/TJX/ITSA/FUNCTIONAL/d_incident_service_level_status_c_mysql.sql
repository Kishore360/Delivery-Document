SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.servc_lvl_status_c' ELSE 'SUCCESS' END as Message
FROM 
tjx_mdwdb.d_incident d
join tjx_mdwdb.f_incident f
on d.row_key=f.incident_key
left join tjx_mdwdb.d_lov b
on f.state_src_key=b.row_key
where d.servc_lvl_status_c <>  CASE WHEN f.servc_lvl_discrepancy_c>=0 THEN 'OUT'
WHEN f.servc_lvl_discrepancy_c<=-24 THEN 'IN'
WHEN (f.servc_lvl_discrepancy_c>-24 AND f.servc_lvl_discrepancy_c<0)
AND b.dimension_name NOT IN ('CLOSED','RESOLVED') THEN 'AMBER'
WHEN (f.servc_lvl_discrepancy_c>-24 AND f.servc_lvl_discrepancy_c<0)
AND b.dimension_name IN ('CLOSED','RESOLVED') THEN 'IN' END
 