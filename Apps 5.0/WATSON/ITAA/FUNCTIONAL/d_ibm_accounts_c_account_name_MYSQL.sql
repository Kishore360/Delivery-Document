SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_ibm_accounts_c.account_name ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.u_ibm_accounts_final src
 left join watson_mdwdb.d_ibm_accounts_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where coalesce(src.u_account_name,'UNSPECIFIED') <>trgt.account_name)ma	;
 
 