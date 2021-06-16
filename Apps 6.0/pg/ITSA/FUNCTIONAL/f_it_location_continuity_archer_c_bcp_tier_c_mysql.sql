SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_it_location_continuity_archer_c.bcp_tier_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.us_it_location_site_sufficiency_archer_final  SRC JOIN png_mdwdb.f_it_location_continuity_archer_c TRGT ON (CONCAT(SRC.First_Published_01348217794,'~',SRC.Tracking_ID_0748258556)= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE CAST(CASE WHEN  SRC.SC_1_1_BCP_Tier_1900112334  ='N/A' THEN NULL ELSE SRC.SC_1_1_BCP_Tier_1900112334 END  as DECIMAL(10,2)) <> (TRGT.bcp_tier_c) 
