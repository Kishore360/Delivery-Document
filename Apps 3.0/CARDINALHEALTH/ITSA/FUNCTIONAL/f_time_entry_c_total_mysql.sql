SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (
						SELECT count(1) as CNT
 FROM
cardinalhealth_mdsdb.time_card_final a 
 JOIN cardinalhealth_mdwdb.d_calendar_date b ON a.week_starts_on = b.week_start_date
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (concat(a.sys_id,'~',b.day_name) =TRGT.row_id  
 AND a.sourceinstance= TRGT.source_id  )
			where
			COALESCE(a.total)<> TRGT.total_hours)a;
			
			