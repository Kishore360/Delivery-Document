 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
  -- FROM  select u_ibm_accounts,trgt.row_id,src.sys_id,trgt.row_key,ibm_accounts_c_key
 from  ibmwatson_mdsdb.u_c_code_final   src
 join  ibmwatson_mdwdb.d_u_c_code_c   trgt2
 on src.sys_id=trgt2.row_id and src.sourceinstance=trgt2.source_id
 where u_value<>value_c	;
 
 
 