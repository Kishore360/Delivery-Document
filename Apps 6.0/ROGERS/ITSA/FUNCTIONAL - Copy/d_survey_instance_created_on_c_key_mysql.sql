SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.taken_by_c_key' ELSE 'SUCCESS' END as Message
FROM  rogers_mdwdb.d_survey_instance a
JOIN rogers_mdsdb.survey_instance_final b ON a.row_id=b.sys_id
AND a.source_id=b.sourceinstance
left join rogers_mdwdb.d_calendar_date  c on DATE_FORMAT(convert_tz(b.sys_created_on,'GMT','America/New_York'),'%Y%m%d')=c.row_id  
where a.soft_deleted_flag='N' and  a.created_on_c_key <>COALESCE(c.row_key,case when b.sys_created_on is null then 0 else -1 end ) and b.cdctype='X' and c.soft_deleted_flag='N'

