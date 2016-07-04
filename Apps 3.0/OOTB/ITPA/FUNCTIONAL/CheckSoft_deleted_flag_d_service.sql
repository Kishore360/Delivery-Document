
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for #DWH_TABLE_NAME' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.#MDS_TABLE_NAME_bwd_delta SRC
LEFT JOIN <<tenant>>_mdwdb.#DWH_TABLE_NAME TRGT 
ON (concat('BUSINESS_SERVICE~',SRC.sys_id)  =TRGT.row_id  
AND SRC.sourceinstance=TRGT.source_id 
)
WHERE SRC.jobid =(select max(jobid) from <<tenant>>_mdsdb.#MDS_TABLE_NAME_bwd_delta 
WHERE sys_id = SRC.sys_id)
AND CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
