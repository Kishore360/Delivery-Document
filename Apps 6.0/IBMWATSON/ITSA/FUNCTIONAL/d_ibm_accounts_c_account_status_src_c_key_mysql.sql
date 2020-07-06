
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 FROM
   ibmwatson_mdsdb.u_ibm_accounts_final s
left join ibmwatson_mdwdb.d_lov d on concat('ACCOUNT_STATUS_C~U_IBM_ACCOUNTS~',u_account_status)=d.row_id and s.cdctype<>'D'
left join  ibmwatson_mdwdb.d_ibm_accounts_c t on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where t.soft_deleted_flag<>'Y' and account_status_src_c_key<> coalesce(d.row_key,case when u_account_status is null then 0 else -1 end ) 