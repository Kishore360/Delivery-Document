SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.tags_result_c' ELSE 'SUCCESS' END as Message
 FROM
   png_mdsdb.us_dgtl_psat_scorecard_report_final SRC
 JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT
ON concat (COALESCE(FLOOR(SRC.Touchpoint_Number),'-','UNSPECIFIED'),COALESCE(SRC.FileDate,'UNSPECIFIED')) = TRGT.row_id
WHERE CASE WHEN SRC.Tags_Scan_Status_Reporting IN ('#N/A' , 'N/A' , 'NA' , '0', '') THEN 'Ignore'
	WHEN SRC.Tags_Scan_Status_Reporting IN ('#N/A' , 'N/A' , 'NA' , '0', '') then 'Ignore'
    ELSE SUBSTRING(SRC.Tags_Scan_Status_Reporting,1,instr(SRC.Tags_Scan_Status_Reporting,':')) 
    end <> TRGT.tags_result_c;