SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM
nypres_mdwdb.d_incident a11
join
nypres_mdwdb.f_incident a12 ON a11.row_key = a12.incident_key
join
nypres_mdwdb.d_lov_map rep ON a12.reported_type_src_key = rep.src_key
join
nypres_mdwdb.d_lov_map st ON a11.state_src_key = st.src_key
where a11.resolved_on_call_c_flag <> IF(rep.dimension_wh_code ='PHONE',
									CASE WHEN st.dimension_wh_code IN ('RESOLVED','CLOSED') 
											AND a12.opened_by_c_key = a12.last_resolved_by_key
											AND a11.multiple_assignment_flag ='N'
											AND a11.reopened_flag ='N'
											AND a12.created_to_resolved_c < 600 AND a12.created_to_resolved_c >=0
										THEN 'Y'
										ELSE 'N' END
									,'X'))a;
									