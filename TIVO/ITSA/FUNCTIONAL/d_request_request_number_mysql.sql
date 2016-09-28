

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.request_number' ELSE 'SUCCESS' END as Message
from
 (select sys_id,number,sourceinstance from
 tivo_mdsdb.u_tech_ops_request_final where sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select sys_id,number,sourceinstance from  tivo_mdsdb.sc_req_item_final
union select sys_id,number,sourceinstance from  tivo_mdsdb.sc_request_final
) s 
 LEFT JOIN tivo_mdwdb.d_request TRGT 
 ON (s.sys_id =TRGT.row_id  
 AND s.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(s.number,'') <> COALESCE(TRGT.request_number ,'')
