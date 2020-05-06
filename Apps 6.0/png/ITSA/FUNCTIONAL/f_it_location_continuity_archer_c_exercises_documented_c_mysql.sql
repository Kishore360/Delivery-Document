SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_it_location_continuity_archer_c.exercises_documented_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.us_it_location_site_sufficiency_archer_final  SRC JOIN png_mdwdb.f_it_location_continuity_archer_c TRGT ON (CONCAT(SRC.First_Published_01348217794,'~',SRC.Tracking_ID_0748258556)= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE CAST(CASE WHEN  SRC.SC_4_3_Exercises_documented_0615643499  ='N/A' THEN NULL ELSE SRC.SC_4_3_Exercises_documented_0615643499 END  as DECIMAL(10,2)) <> (TRGT.exercises_documented_c) 
