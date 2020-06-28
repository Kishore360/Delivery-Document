SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_dts_vwrcsadata_c.risk_taxonomy_level_1' ELSE 'SUCCESS' END as Message FROM bbandt_mdsdb.DTS_vwRCSAData_final  SRC JOIN bbandt_mdwdb.d_dts_vwrcsadata_c TRGT ON (SRC.Primary_Key = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.Risk_Taxonomy_Level_1 <> (TRGT.risk_taxonomy_level_1) 
