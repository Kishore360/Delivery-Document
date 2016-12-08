
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_incident a
JOIN nbcu_mdsdb.incident_final s ON a.row_id=s.sys_id AND a.source_id = s.sourceinstance
where CASE 
		WHEN convert_tz(s.closed_at,'GMT','Europe/Belfast') IS NOT NULL
			THEN CASE 
					WHEN DATE (convert_tz(s.opened_at,'GMT','Europe/Belfast')) > DATE (convert_tz(s.closed_at,'GMT','Europe/Belfast'))
						THEN 0
					WHEN DATE (convert_tz(s.opened_at,'GMT','Europe/Belfast')) = DATE (convert_tz(s.closed_at,'GMT','Europe/Belfast'))
						THEN CASE 
								WHEN DATE (convert_tz(s.opened_at,'GMT','Europe/Belfast')) IN (
										SELECT uk_working_date
										FROM nbcu_mdsdb.us_uk_holiday_map_final
										WHERE holiday_flag = 'Y'
										)
									THEN 0
								WHEN (
										hour(convert_tz(s.opened_at,'GMT','Europe/Belfast')) BETWEEN 8
											AND 17
										)
									AND (
										hour(convert_tz(s.closed_at,'GMT','Europe/Belfast')) BETWEEN 8
											AND 17
										)
									THEN TIMESTAMPDIFF(second, convert_tz(s.opened_at,'GMT','Europe/Belfast'), convert_tz(s.closed_at,'GMT','Europe/Belfast'))
								WHEN (hour(convert_tz(s.opened_at,'GMT','Europe/Belfast')) < 8)
									AND (
										hour(convert_tz(s.closed_at,'GMT','Europe/Belfast')) BETWEEN 8
											AND 17
										)
									THEN TIMESTAMPDIFF(second, CAST(CONCAT (
													DATE (convert_tz(s.closed_at,'GMT','Europe/Belfast'))
													,' 08:00:00'
													) AS DATETIME), convert_tz(s.closed_at,'GMT','Europe/Belfast'))
								WHEN (hour(convert_tz(s.opened_at,'GMT','Europe/Belfast')) < 8)
									AND (hour(convert_tz(s.closed_at,'GMT','Europe/Belfast')) >= 18)
									THEN 36000
								ELSE 0
								END
					WHEN DATE (convert_tz(s.closed_at,'GMT','Europe/Belfast')) > DATE (convert_tz(s.opened_at,'GMT','Europe/Belfast'))
						THEN (
								CASE 
									WHEN DATE (convert_tz(s.opened_at,'GMT','Europe/Belfast')) IN (
											SELECT DATE (uk_working_date)
											FROM nbcu_mdsdb.us_uk_holiday_map_final
											WHERE holiday_flag = 'Y'
											)
										THEN 0
									ELSE CASE 
											WHEN (
													hour(convert_tz(s.opened_at,'GMT','Europe/Belfast')) BETWEEN 8
														AND 17
													)
												THEN TIMESTAMPDIFF(second, convert_tz(s.opened_at,'GMT','Europe/Belfast'), CAST(CONCAT (
																DATE (convert_tz(s.opened_at,'GMT','Europe/Belfast'))
																,' 18:00:00'
																) AS DATETIME))
											WHEN (HOUR(convert_tz(s.opened_at,'GMT','Europe/Belfast'))) < 8
												THEN 36000
											ELSE 0
											END
									END
								) + (
								CASE 
									WHEN DATE (convert_tz(s.closed_at,'GMT','Europe/Belfast')) IN (
											SELECT DATE (uk_working_date)
											FROM nbcu_mdsdb.us_uk_holiday_map_final
											WHERE holiday_flag = 'Y'
											)
										THEN 0
									ELSE CASE 
											WHEN (HOUR(convert_tz(s.closed_at,'GMT','Europe/Belfast'))) BETWEEN 8
													AND 18
												THEN TIMESTAMPDIFF(second, CAST(CONCAT (
																DATE (convert_tz(s.closed_at,'GMT','Europe/Belfast'))
																,' 08:00:00'
																) AS DATETIME), convert_tz(s.closed_at,'GMT','Europe/Belfast'))
											WHEN (HOUR(convert_tz(s.closed_at,'GMT','Europe/Belfast'))) >= 18
												THEN 36000
											ELSE 0
											END
									END
								) + (
								SELECT COUNT(1) * 36000
								FROM nbcu_mdsdb.us_uk_holiday_map_final
								WHERE DATE (uk_working_date) > DATE (convert_tz(s.opened_at,'GMT','Europe/Belfast'))
									AND DATE (uk_working_date) < DATE (convert_tz(s.closed_at,'GMT','Europe/Belfast'))
									AND holiday_flag = 'N'
								)
					ELSE 0
					END
		ELSE NULL
		END<>a.uk_business_duration_c