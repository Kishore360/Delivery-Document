		
					SELECT	CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_syseng_server_inv_history_fact_c.platform_c' 
ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
				mercury_mdsdb.syseng_server_inv_history_final SRC 
				join 
				mercury_mdwdb.f_syseng_server_inv_history_fact_c TRGT 
				on DATE_FORMAT(STR_TO_DATE(SRC.date_time,
                '%Y-%m-%d'),
                '%Y%m%d')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id and SRC.cdctype<>'D' 
				where coalesce(SRC.platform,'UNSPECIFIED')<>TRGT.platform_c
				)a;