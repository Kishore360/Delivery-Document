SELECT  
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.parent_change_request_key' ELSE 'SUCCESS' END as Message

-- COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) , TRGT.parent_change_request_key
FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.change_request_final where cdctype<>'D') SRC
  LEFT JOIN (select row_key,row_id,parent_change_request_key from <<tenant>>_mdwdb.d_change_request) PARENT 
 ON coalesce(SRC.parent,'UNSPECIFIED')= PARENT.row_id 
 JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) <> TRGT.parent_change_request_key)temp;