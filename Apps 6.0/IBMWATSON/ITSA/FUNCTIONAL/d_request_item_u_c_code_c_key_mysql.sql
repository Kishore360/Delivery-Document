 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 -- select src.sys_id,b.c_code_new,trgt2.row_id-- ,coalesce(trgt.row_key,case when c_code_new is null then 0 else -1 end),trgt.u_c_code_c_key
 from  ibmwatson_mdsdb.sc_req_item_final src
  join ibmwatson_mdsdb.sc_req_item_ext_final b on src.sys_id=b.record_id  and src.sourceinstance=2
 left join ibmwatson_mdwdb.d_request_item trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 left join  ibmwatson_mdwdb.d_u_c_code_c   trgt2
 on b.c_code_new=trgt2.row_id and src.sourceinstance=trgt2.source_id
 where coalesce(trgt2.row_key,case when c_code_new is null then 0 else -1 end)<>trgt.u_c_code_c_key 