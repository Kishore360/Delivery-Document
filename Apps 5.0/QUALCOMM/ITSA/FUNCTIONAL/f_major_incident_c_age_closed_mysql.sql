 select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_major_incident_c.age_closed' ELSE 'SUCCESS' END as Message from ( select count(1) cnt 
 FROM qualcomm_mdsdb.u_major_incident_final SRC 
  JOIN qualcomm_mdwdb.f_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id )
 join qualcomm_mdwdb.d_major_incident_c D
 on D.row_key = TRGT.major_incident_c_key
AND TRGT.source_id = D.source_id
 left join qualcomm_mdwdb.d_lov_map lm 
 ON (lm.src_key = TRGT.major_incident_state_key)
 where lm.dimension_wh_code = 'CLOSED'  
AND COALESCE(TIMESTAMPDIFF(SECOND,D.opened_at_c,D.closed_at_c),'GMT','GMT')<> TRGT.age )a
 
 


 
 