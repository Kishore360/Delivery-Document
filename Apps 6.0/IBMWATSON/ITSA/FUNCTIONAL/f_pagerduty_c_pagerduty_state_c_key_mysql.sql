SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_pagerduty_c.state_src_key ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.x_pd_integration_additional_pagerduty_final src
 left join ibmwatson_mdwdb.f_pagerduty_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 left join ibmwatson_mdwdb.d_lov lkp on COALESCE(CONCAT('STATE','~','PAGERDUTY','~',UPPER(src.state)),'UNSPECIFIED')=lkp.row_id
 and src.sourceinstance=lkp.source_id
 where coalesce(lkp.row_key,case when src.state is null then 0 else -1 end)<>trgt.pagerduty_state_c_key)ma;
 
 