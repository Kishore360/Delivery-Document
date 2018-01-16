SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.servc_lvl_discrepancy_c' ELSE 'SUCCESS' END as Message
FROM 
tjx_mdwdb.d_incident d
join tjx_mdwdb.f_incident f
on d.row_key=f.incident_key
where f.servc_lvl_discrepancy_c <> ROUND(CAST(d.servc_lvl_tgt_c AS DECIMAL)-(f.servc_lvl_duration_c/3600))
or f.servc_lvl_discrepancy_c is null;