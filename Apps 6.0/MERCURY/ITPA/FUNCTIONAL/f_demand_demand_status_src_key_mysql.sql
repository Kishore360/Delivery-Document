
SELECT count(1) FROM mercury_mdsdb.hp_kcrt_requests_final SRC
 LEFT JOIN mercury_mdwdb.f_demand TRGT 
 ON (SRC.REQUEST_ID =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) and SRC.cdctype<>'D'
LEFT JOIN mercury_mdwdb.d_lov LKP 
 ON ( concat('DEMAND','~','STATUS','~',upper(STATUS_ID))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.STATUS_ID IS NULL THEN 0 else -1 end) <> (TRGT.demand_status_src_key);