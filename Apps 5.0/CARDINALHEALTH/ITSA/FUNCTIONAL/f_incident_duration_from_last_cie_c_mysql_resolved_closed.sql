


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
cardinalhealth_mdwdb.f_incident f_inc
JOIN cardinalhealth_mdwdb.d_lov_map br ON f_inc.etl_run_number = @#PARENT_ETL_RUN_ID@# and f_inc.state_src_key = br.src_key AND br.dimension_wh_code in ('RESOLVED','CLOSED')
JOIN cardinalhealth_mdwdb.d_incident d_inc ON d_inc.row_key = f_inc.incident_key 
JOIN cardinalhealth_mdwdb.d_o_data_freshness df ON d_inc.source_id = df.source_id 
where f_inc.duration_from_last_cie_c <> if(timestampdiff(SECOND,d_inc.cie_last_changed_on_c,coalesce(d_inc.last_resolved_on,d_inc.closed_on))>0,timestampdiff(SECOND,d_inc.cie_last_changed_on_c,coalesce(d_inc.last_resolved_on,d_inc.closed_on)),0);


