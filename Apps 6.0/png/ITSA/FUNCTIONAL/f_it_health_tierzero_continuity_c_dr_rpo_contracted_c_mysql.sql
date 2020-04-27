SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_it_health_tierzero_continuity_c.dr_rpo_contracted_c' ELSE 'SUCCESS' END as Message FROM png_mdsdb.us_tier_0_apps_final  SRC JOIN png_mdwdb.f_it_health_tierzero_continuity_c TRGT ON (CONCAT(SRC.HEXID,'~',SRC.Measures_As_Of)= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE CAST( SRC.DR_RPO_Contracted   as DECIMAL(10,2)) <> (TRGT.dr_rpo_contracted_c) 
