 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 JOIN cardinalhealth_mdwdb.d_calendar_date b ON SRC.week_starts_on = b.week_start_date
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (concat(SRC.sys_id,'~',b.day_name) =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where CASE
			 WHEN b.day_name='Sunday' THEN SRC.sunday
			 WHEN b.day_name='Monday' THEN SRC.monday
			 WHEN b.day_name='Tuesday' THEN SRC.tuesday
			 WHEN b.day_name='Wednesday' THEN SRC.wednesday
			 WHEN b.day_name='Thursday' THEN SRC.thursday
			 WHEN b.day_name='Friday' THEN SRC.friday
			 WHEN b.day_name='Saturday' THEN SRC.saturday
			 ELSE 0
		 END <> TRGT.effort_duration)temp
		 
		 