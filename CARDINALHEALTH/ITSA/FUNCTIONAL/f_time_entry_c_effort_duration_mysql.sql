SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.time_card_final SRC
 JOIN cardinalhealth_mdwdb.d_calendar_date b ON SRC.week_starts_on = b.week_start_date
	AND b.source_id=2 
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (CONCAT(SRC.sys_id,'~',b.day_name) =TRGT.row_id
 AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE   CASE
			 WHEN b.day_name ='Sunday' THEN sunday
			 WHEN b.day_name ='Monday' THEN monday
			 WHEN b.day_name ='Tuesday' THEN tuesday
			 WHEN b.day_name ='Wednesday' THEN wednesday
			 WHEN b.day_name ='Thursday' THEN thursday
			 WHEN b.day_name ='Friday' THEN friday
			 WHEN b.day_name ='Saturday' THEN saturday
			 ELSE 0		 END <> effort_duration;