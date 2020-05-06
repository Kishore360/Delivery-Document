SELECT  CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_it_location_continuity_archer_c.location_key' ELSE 'SUCCESS' END as Message FROM png_mdsdb.us_it_location_site_sufficiency_archer_final  SRC JOIN png_mdwdb.f_it_location_continuity_archer_c TRGT ON (CONCAT(SRC.First_Published_01348217794,'~',SRC.Tracking_ID_0748258556)= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
LEFT JOIN(SELECT max(row_key) as row_key,sap_site_code_c,location_name from png_mdwdb.d_location group by 2,3 ) a 
ON SRC.Location = a.location_name and SRC.Site_Code_Name_259747999 = a.sap_site_code_c
LEFT JOIN(SELECT max(row_key) as row_key,sap_site_code_c from png_mdwdb.d_location group by 2 ) b
ON  SRC.Site_Code_Name_259747999 = b.sap_site_code_c

  WHERE COALESCE(a.row_key,b.row_key,-1) <> (TRGT.location_key) 
