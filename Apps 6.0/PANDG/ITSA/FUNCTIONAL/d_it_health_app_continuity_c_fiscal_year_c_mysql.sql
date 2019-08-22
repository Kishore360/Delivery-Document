SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_it_health_app_continuity_c.fiscal_year_c' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.us_health_app_continuity_c_final SRC
 JOIN png_mdwdb.d_it_health_app_continuity_c TRGT
ON concat (COALESCE(SRC.Actual_As_Of,'UNSPECIFIED'),COALESCE(SRC.Application,'UNSPECIFIED'),
COALESCE(SRC.CBP,'UNSPECIFIED')) = TRGT.row_id
where SRC.Fiscal_Year<>TRGT.fiscal_year_c