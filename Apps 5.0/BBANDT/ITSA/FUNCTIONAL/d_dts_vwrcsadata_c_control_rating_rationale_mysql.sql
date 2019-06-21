SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_dts_vwrcsadata_c.short_description' ELSE 'SUCCESS' END as Message FROM bbandt_mdsdb.DTS_vwRCSAData_final  SRC JOIN bbandt_mdwdb.d_dts_vwrcsadata_c TRGT ON (SRC.Primary_Key = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.Control_Rating_Rationale <> (TRGT.control_rating_rationale) 
