SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_it_location_continuity_c.strategy_c
' ELSE 'SUCCESS' END as Message
 FROM(select count(1) as cnt from 
  png_mdsdb.us_location_continuity_itsa_c_final SRC
 JOIN png_mdwdb.f_it_location_continuity_c TRGT
ON concat(COALESCE(SRC.Actual_of,'UNSPECIFIED'),'~',COALESCE(SRC.Site,'UNSPECIFIED')) = TRGT.row_id
where ROUND(SRC.Strategy,5)<>TRGT.strategy_c)ma
