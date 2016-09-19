<<<<<<< HEAD
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from bbandt_mdsdb.change_request_final a
left JOIN bbandt_mdwdb.d_change_request b
on a.sys_id= b.row_id and a.sourceinstance=b.source_id
LEFT JOIN bbandt_mdwdb.d_lov LKP 
 ON ( concat('',u_close_code )= LKP.row_id 
AND a.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN a.u_close_code  IS NULL THEN 0 else -1 end)<>b.close_code_c_key)temp; 
=======
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_c_key' ELSE 'SUCCESS' END as Message
 FROM bbandt_mdsdb.change_request_final SRC 
 LEFT JOIN bbandt_mdwdb.d_change_request TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN bbandt_mdwdb.d_lov LKP 
 ON  LKP.dimension_class =  'CLOSE_CODE_C~CHANGE_REQUEST' and (concat('CLOSE_CODE_C~CHANGE_REQUEST~~~',upper(SRC.u_close_code))= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_close_code IS NULL THEN 0 else -1 end)<> (TRGT.close_code_c_key);
>>>>>>> c66a29e374555850ece04e086beca80e1dc83715
