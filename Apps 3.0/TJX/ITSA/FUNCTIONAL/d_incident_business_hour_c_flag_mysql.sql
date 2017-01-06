SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.incident_final SRC
join tjx_mdwdb.d_incident TRGT
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

where case when time(CONVERT_TZ(SRC.opened_at,
		'GMT',
		'America/New_York'))  between time('08:00:00') and  time('18:00:00') 
		 and DAYNAME(DATE(CONVERT_TZ(SRC.opened_at,
		'GMT',
		'America/New_York'))) in('Monday' ,'Tuesday','Wednesday','Thursday','Friday') then 'Y' else 'N' end
		 <> TRGT. business_hour_c_flag; 