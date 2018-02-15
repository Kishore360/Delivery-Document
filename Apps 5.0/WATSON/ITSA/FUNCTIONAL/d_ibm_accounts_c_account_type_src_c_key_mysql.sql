

 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 FROM   watson_mdsdb.u_ibm_accounts_final s
left join watson_mdwdb.d_lov d on concat('ACCOUNT_TYPE_C~U_IBM_ACCOUNTS~~~',u_account_type)=d.row_id
left join  watson_mdwdb.d_ibm_accounts_c t on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where account_type_src_c_key<> coalesce(d.row_key,case when u_account_type is null then 0 else -1 end )
