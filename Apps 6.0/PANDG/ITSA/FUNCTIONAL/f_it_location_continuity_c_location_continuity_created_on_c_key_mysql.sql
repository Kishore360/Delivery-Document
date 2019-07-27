SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_it_location_continuity_c.location_continuity_created_on_c_key' ELSE 'SUCCESS' END as Message
 FROM
   png_mdsdb.us_location_continuity_itsa_c_final SRC
 JOIN png_mdwdb.f_it_location_continuity_c TRGT
ON concat(COALESCE(SRC.Actual_of,'UNSPECIFIED'),'~',COALESCE(SRC.Site,'UNSPECIFIED')) = TRGT.row_id
 LEFT JOIN png_mdwdb.d_calendar_date LKP 
on LKP.row_id  = date_format(SRC.Actual_Of,'%Y%m%d') 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.Actual_Of IS NULL THEN 0 else '-1' end)  <> TRGT.location_continuity_created_on_c_key;
