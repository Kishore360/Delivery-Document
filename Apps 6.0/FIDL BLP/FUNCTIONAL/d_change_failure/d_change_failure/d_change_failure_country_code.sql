select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.country_code' ELSE 'SUCCESS' END as Message
from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
  LEFT JOIN fidelity_mdwdb.d_location LKP 
 ON ( SRC.location = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 where coalesce(LKP.country_code,'UNSPECIFIED') <> coalesce(TRGT.country_code,'')
