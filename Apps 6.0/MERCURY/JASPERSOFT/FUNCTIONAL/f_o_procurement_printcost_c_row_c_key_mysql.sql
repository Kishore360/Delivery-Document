
   SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_o_procurement_printcost_c.row_c_key' ELSE 'SUCCESS' END as Message FROM meritsa_mdsdb.o_procurement_printcost_final  SRC left JOIN meritsa_mdwdb.f_o_procurement_printcost_c TRGT ON (SRC.row_date = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id and SRC.cdctype<>'D' )  LEFT JOIN meritsa_mdwdb.d_calendar_date LKP  ON  SRC.row_date = LKP.row_id  WHERE COALESCE(LKP.row_key,CASE WHEN SRC.row_date IS NULL THEN 0 else -1 end) <> (TRGT.row_c_key)
   
   
   