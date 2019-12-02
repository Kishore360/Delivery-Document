  SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_demand.demand_status_src_key' 
ELSE 'SUCCESS' END as Message 
FROM 
( 
SELECT count(1) as CNT FROM mercury_mdsdb.hp_kcrt_requests_final SRC
 LEFT JOIN mercury_mdwdb.f_demand TRGT 
 ON (SRC.REQUEST_ID =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) and SRC.cdctype<>'D'
LEFT JOIN mercury_mdwdb.d_lov LKP 
 ON ( concat('DEMAND','~','STATUS','~',upper(STATUS_ID))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.STATUS_ID IS NULL THEN 0 else -1 end) <> (TRGT.demand_status_src_key))A;