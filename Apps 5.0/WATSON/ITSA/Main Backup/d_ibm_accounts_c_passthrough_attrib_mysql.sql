 
 
 

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 FROM   watson_mdsdb.u_ibm_accounts_final
left join  watson_mdwdb.d_ibm_accounts_c on sys_id=row_id and sourceinstance=source_id
where   (u_account_name<>account_name or u_account_id<>u_account_id_c or 
u_softlayer_account_id<>u_softlayer_account_id_c or (case when u_bluemix_account=1 then 'Y' else 'N' end)<>u_bluemix_account_c or 
(case when u_eu_managed=1 then 'Y' else 'N' end) <>u_eu_managed_c ) AND u_ibm_accounts_final.CDCTYPE<>'D' ; 

