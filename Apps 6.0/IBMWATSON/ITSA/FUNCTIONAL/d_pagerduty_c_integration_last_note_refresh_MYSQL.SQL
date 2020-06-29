SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_pagerduty_c.integration_last_notes_refresh ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.x_pd_integration_additional_pagerduty_final src
 left join ibmwatson_mdwdb.d_pagerduty_c trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where src.x_pd_integration_last_notes_refresh=trgt.integration_last_notes_refresh)ma;
 
 