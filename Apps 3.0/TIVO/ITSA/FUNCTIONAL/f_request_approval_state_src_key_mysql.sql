SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as cnt from 
tivo_mdsdb.u_tech_ops_request_final SRC 
  JOIN tivo_mdwdb.f_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND SRC.sys_id not in (SELECT distinct sys_id from tivo_mdsdb.sc_request_final))
JOIN tivo_mdwdb.d_lov LKP 
 ON (concat('APPROVAL','~','SC_REQUEST','~','~','~',upper(SRC.approval))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else -1 end)<> (TRGT.APPROVAL_STATE_SRC_KEY)

 UNION

 SELECT count(1) as cnt from 
tivo_mdsdb.sc_req_item_final SRC 
  JOIN tivo_mdwdb.f_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id AND SRC.sys_id not in (SELECT distinct sys_id from tivo_mdsdb.sc_request_final) )
JOIN tivo_mdwdb.d_lov LKP 
 ON (CONCAT('APPROVAL','~','SC_REQ_ITEM','~','~','~',upper(SRC.approval))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else -1 end)<> (TRGT.APPROVAL_STATE_SRC_KEY)
)a

