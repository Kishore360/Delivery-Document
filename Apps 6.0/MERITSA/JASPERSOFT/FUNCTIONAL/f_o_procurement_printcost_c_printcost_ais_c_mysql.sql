SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_o_procurement_printcost_c.printcost_ais_c' ELSE 'SUCCESS' END as Message FROM meritsa_mdsdb.o_procurement_printcost_final  SRC left JOIN meritsa_mdwdb.f_o_procurement_printcost_c TRGT ON (SRC.row_date = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id and SRC.cdctype<>'D' )  WHERE SRC.printcost_ais <> (TRGT.printcost_ais_c) 



