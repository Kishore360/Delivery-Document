SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) cnt from wow_mdwdb.d_incident trgt
INNER JOIN wow_mdsdb.u_incident_outage_final src 
                ON trgt.row_id = src.sys_id
                AND trgt.source_id = src.sourceinstance
where 
trgt.no_of_total_modems_on_node_c<>COALESCE(src.u_of_total_modems_on_node,0))g
