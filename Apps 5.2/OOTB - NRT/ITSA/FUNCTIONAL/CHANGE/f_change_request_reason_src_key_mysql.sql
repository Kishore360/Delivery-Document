

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.reason_src_key' ELSE 'SUCCESS' END as Message 
 FROM
 (SELECT count(1) as CNT
from (select COALESCE(LKP.row_key,CASE WHEN SRC.reason IS NULL THEN 0 else '-1' end)abc,
(TRGT.reason_src_key)def
 FROM (select * from <<tenant>>_mdsdb.change_request_final where cdctype<>'D') SRC
  JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( CONCAT('REASON','~','CHANGE_REQUEST','~','~','~',UPPER(reason))= LKP.src_rowid 
 
AND SRC.sourceinstance= LKP.source_id ))a
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and abc<>def)temp;

