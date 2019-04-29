SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from aetna_mdsdb.change_request_final SRC 
 LEFT JOIN aetna_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE case when SRC.cab_required=1 then 'Y' else 'N' end<>TRGT.cab_required_c
 and TRGT.soft_deleted_flag='N' and SRC.cdctype<>'D')ma