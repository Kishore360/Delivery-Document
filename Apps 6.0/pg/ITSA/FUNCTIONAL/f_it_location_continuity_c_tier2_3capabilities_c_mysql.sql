SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_it_location_continuity_c.tier2_3capabilities_c
' ELSE 'SUCCESS' END as Message
 FROM
  png_mdsdb.us_location_continuity_itsa_c_final SRC
 JOIN png_mdwdb.f_it_location_continuity_c TRGT
ON concat(COALESCE(SRC.Actual_of,'UNSPECIFIED'),'~',COALESCE(SRC.Site,'UNSPECIFIED')) = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
where ROUND(SRC.Tier2_3capabilities,5) <> TRGT.tier2_3capabilities_c
