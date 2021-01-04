
 
 
 
 
 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt
 FROM mercury_mdsdb.sc_req_item_final SRC 
 LEFT JOIN mercury_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND SRC.cdctype<>'D')
LEFT JOIN mercury_mdwdb.d_lov LKP
on LKP.row_id=COALESCE(CONCAT('STAGE','~','SC_REQ_ITEM','~',UPPER(SRC.stage)),'UNSPECIFIED') and SRC.sourceinstance=LKP.source_id
where  COALESCE(LKP.row_key,CASE WHEN SRC.stage IS NULL THEN 0 else '-1' end) <> TRGT.stage_src_key and SRC.cdctype<>'D'
) g



