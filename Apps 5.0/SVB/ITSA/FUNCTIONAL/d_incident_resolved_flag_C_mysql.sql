SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'DWH data validation failed for d_incident_resolved_flag_C' ELSE 'SUCCESS' END as Message
 FROM ( 
 select SRC.resolved_flag_C trgt,case when SRC.last_resolved_on < SRC.resolve_deadline_c then 'Y' else 'N' END src1
  from
 svb_mdwdb.d_incident SRC
 LEFT join svb_mdwdb.d_lov_map dlm 
	ON SRC.close_code_src_key = dlm.src_key
	where   dlm.dimension_wh_code <> 'INVALID INCIDENT')a
 where src1<>trgt; 
 

 
 