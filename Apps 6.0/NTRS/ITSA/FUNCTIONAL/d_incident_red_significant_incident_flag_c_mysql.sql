SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
ntrs_mdwdb.d_incident TRGT  
JOIN 	ntrs_mdsdb.incident_final 	SRC  
ON 		SRC.sys_id		=		TRGT.row_id and SRC.sourceinstance=TRGT.source_id                
where TRGT.red_significant_incident_flag_c  <> CASE when TRGT.significant_incident_flag_c	  = 'Y'  AND SRC.u_color = 'Red' THEN  'Y'
 WHEN TRGT.significant_incident_flag_c 	  = 'Y' AND (SRC.u_color <> 'Red' or SRC.u_color is null) THEN  'N' Else 'N/A' END  )a;
