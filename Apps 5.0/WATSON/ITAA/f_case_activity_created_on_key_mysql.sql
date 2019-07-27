
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.changed_on' ELSE 'SUCCESS' END as Message
  FROM watson_mdsdb.sys_audit_final src
left join watson_mdwdb.d_calendar_date lkp on date_format(CONVERT_TZ (sys_created_on,'GMT','UTC'),'%Y%m%d') =lkp.row_id 
join watson_mdwdb.f_case_activity trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where created_on_key <>coalesce(lkp.row_key,case when sys_created_on is null then 0 else -1 end );

