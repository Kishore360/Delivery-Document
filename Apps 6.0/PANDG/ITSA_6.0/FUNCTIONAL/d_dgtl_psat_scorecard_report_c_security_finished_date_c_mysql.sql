SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_dgtl_psat_scorecard_report_c.security_finished_date_c' ELSE 'SUCCESS' END as Message
 FROM
   png_mdsdb.us_dgtl_psat_scorecard_report_final SRC
 JOIN png_mdwdb.d_dgtl_psat_scorecard_report_c TRGT
ON concat (COALESCE(FLOOR(SRC.Touchpoint_Number),'-','UNSPECIFIED'),COALESCE(SRC.FileDate,'UNSPECIFIED')) = TRGT.row_id
WHERE cast(SRC.Security_Finish_Date as Date) <> TRGT.security_finished_date_c;

