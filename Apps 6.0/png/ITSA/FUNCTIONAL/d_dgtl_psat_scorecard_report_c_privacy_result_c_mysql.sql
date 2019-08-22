SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.security_result_c' ELSE 'SUCCESS' END as Message
 FROM
   png_mdsdb.us_dgtl_psat_scorecard_report_final SRC
 JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT
ON concat (COALESCE(FLOOR(SRC.Touchpoint_Number),'-','UNSPECIFIED'),COALESCE(SRC.FileDate,'UNSPECIFIED')) = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN SRC.Privacy_Scan_Status_Reporting IN ('#N/A' , 'N/A' , 'NA' , '0', '') THEN 'Ignore'
	WHEN SRC.Privacy_Scan_Status_Reporting IN ('#N/A' , 'N/A' , 'NA' , '0', '') then 'Ignore'
    ELSE SUBSTRING(SRC.Privacy_Scan_Status_Reporting,1,instr(SRC.Privacy_Scan_Status_Reporting,':')) 
    end <> TRGT.privacy_result_c;



