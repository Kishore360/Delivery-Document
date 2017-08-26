
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for d_lov' ELSE 'SUCCESS' END as Message
from (select * from cardinalhealth_mdsdb.synonyms_bwd_delta where jobid =
(select max(jobid) from cardinalhealth_mdsdb.synonyms_bwd_delta ) AND cdctype <>'I') SRC
LEFT JOIN cardinalhealth_mdwdb.d_lov TRGT 
	ON (CONCAT('AUX~CCA~~~',acd_no,'~',trim(SRC.value)) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.created_on is null
AND SRC.item_type = 'aux_rsn'
and CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')


