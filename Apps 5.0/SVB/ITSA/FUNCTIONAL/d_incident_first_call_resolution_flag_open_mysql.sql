SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.resolution_code_src_c_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM svb_mdwdb.d_incident d
JOIN svb_mdwdb.f_incident f ON d.row_key = f.incident_key AND f.source_id = d.source_id
JOIN svb_mdwdb.d_lov_map br ON f.state_src_key = br.src_key AND br.dimension_wh_code = 'OPEN' AND br.dimension_class = 'STATE~INCIDENT'
JOIN (
select source_id,max(lastupdated) as lastupdated from  svb_mdwdb.d_o_data_freshness
group by source_id
) df ON f.source_id = df.source_id
where case when  TIMESTAMPDIFF(MINUTE, d.opened_on, df.lastupdated) < 30 then 'P' else 'N' end<>d.first_call_resolution_flag
)b