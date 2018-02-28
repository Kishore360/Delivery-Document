
 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.u_sr_number_c
' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aetna_mdsdb.change_request_final SRC
 LEFT JOIN aetna_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  WHERE COALESCE( SRC.u_sr_number,'UNSPECIFIED') 
<> (TRGT.u_sr_number_c

))b;