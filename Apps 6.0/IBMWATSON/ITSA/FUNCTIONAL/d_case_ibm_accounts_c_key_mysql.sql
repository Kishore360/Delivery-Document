 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
  -- FROM  select u_ibm_accounts,trgt.row_id,src.sys_id,trgt.row_key,ibm_accounts_c_key
 from  ibmwatson_mdsdb.sn_customerservice_case_final src
 left join ibmwatson_mdwdb.d_ibm_accounts_c trgt 
 on u_ibm_accounts=trgt.row_id and src.sourceinstance=trgt.source_id
 join  ibmwatson_mdwdb.d_case trgt2
 on src.sys_id=trgt2.row_id and src.sourceinstance=trgt2.source_id
 where coalesce(trgt.row_key,case when u_ibm_accounts is null then 0 else -1 end)<>trgt2.ibm_accounts_c_key	;