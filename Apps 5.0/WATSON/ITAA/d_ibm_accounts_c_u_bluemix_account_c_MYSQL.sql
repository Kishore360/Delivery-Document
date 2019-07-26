SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_ibm_accounts_c.u_bluemix_account_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.u_ibm_accounts_final src
 left join watson_mdwdb.d_ibm_accounts_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where case when src.u_bluemix_account=1 then 'Y' else 'N' end<>trgt.u_bluemix_account_c)ma	;
 
 