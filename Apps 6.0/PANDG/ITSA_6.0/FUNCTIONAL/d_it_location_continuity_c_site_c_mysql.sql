SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_it_location_continuity_c.site_c' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.us_location_continuity_itsa_c_final SRC
 JOIN png_mdwdb.d_it_location_continuity_c TRGT
ON concat(COALESCE(SRC.Actual_of,'UNSPECIFIED'),'~',COALESCE(SRC.Site,'UNSPECIFIED')) = TRGT.row_id
where SRC.Site<>TRGT.site_c
