SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.source_id' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from wpl_mdsdb.u_ad_hoc_request_final SRC 
 join wpl_mdwdb.d_ad_hoc_request_c TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where  SRC.sourceinstance<>TRGT.source_id and SRC.cdctype='X')ma