SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.created_on_c_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.survey_instance_final SRC
 LEFT JOIN nbcu_mdwdb.d_survey_instance TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left join nbcu_mdwdb.d_calendar_date d 
on DATE_FORMAT(convert_tz(SRC.sys_created_on,'GMT','America/New_York'),'%Y%m%d')=d.row_id 
where created_on_c_key<>coalesce(d.row_key,case when SRC.sys_created_on is null then 0 else -1 end ) 