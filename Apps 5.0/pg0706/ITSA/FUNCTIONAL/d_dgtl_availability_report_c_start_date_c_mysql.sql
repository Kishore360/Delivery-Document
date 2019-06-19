SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_dgtl_availability_report_c.start_date_c' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.us_dgtl_availability_report_final SRC
 JOIN png_mdwdb.d_dgtl_availability_report_c TRGT
ON concat (COALESCE(FLOOR(SRC.CI_ID),'-','UNSPECIFIED'),COALESCE(SRC.START_DATE,'UNSPECIFIED')) = TRGT.row_id and  SRC.sourceinstance=TRGT.source_id
where SRC.START_DATE  <> TRGT.start_date_c

