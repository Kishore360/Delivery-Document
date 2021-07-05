

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT 
 FROM (select * from mcd_mdsdb.problem_final where cdctype<>'D') SRC 
 LEFT JOIN mcd_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN mcd_mdwdb.d_lov LKP 
 ON ( concat('STATE','~','PROBLEM','~','~','~',upper(state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key))temp;
