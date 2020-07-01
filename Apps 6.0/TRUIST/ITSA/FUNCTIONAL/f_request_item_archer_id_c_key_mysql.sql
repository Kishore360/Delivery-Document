select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_request_item.archer_id_c_key'  ELSE 'SUCCESS'  END as Message
--  select distinct SRC.number,COALESCE(SRC.cmdb_ci,'UNSPECIFIED'),COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END) erow,
-- LKP.row_id ,LKP.dw_updated_on,TRGT.dw_updated_on,TRGT.archer_id_c_key
FROM truist_mdsdb.sc_req_item_final SRC 
JOIN truist_mdwdb.f_request_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN truist_mdwdb.d_software_c LKP 
ON COALESCE(SRC.cmdb_ci,'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>TRGT.archer_id_c_key 
and SRC.cdctype='X';

