SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (SRC.sys_id =LEFT(TRGT.row_id,32 )  
 JOIN cardinalhealth_mdwdb.d_calendar_date b ON a.week_starts_on = b.week_start_date
	AND b.source_id=2;
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE   CASE
			 WHEN day_name='Sunday' THEN sunday
			 WHEN day_name='Monday' THEN monday
			 WHEN day_name='Tuesday' THEN tuesday
			 WHEN day_name='Wednesday' THEN wednesday
			 WHEN day_name='Thursday' THEN thursday
			 WHEN day_name='Friday' THEN friday
			 WHEN day_name='Saturday' THEN saturday
			 ELSE 0
		 END <> effort_duration;