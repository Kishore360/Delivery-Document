SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
 FROM gilead_mdsdb.cmn_location_final SRC
join gilead_mdwdb.d_location a
 ON (SRC.sys_id =a.row_id  
 AND SRC.sourceinstance= a.source_id  )
left join  gilead_mdwdb.d_location b 
on a.site_c_key = b.row_key 
and a.site_c_key not in (0,-1) 
and (b.country_code is not null or b.region_c is not null )
where a.country_code<>b.country_code