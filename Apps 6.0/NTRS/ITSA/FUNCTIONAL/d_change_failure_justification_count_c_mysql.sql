
				
				
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.justification_count_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE coalesce(char_length(REPLACE(SRC.justification,
                ' ',
                '')),
                -1) <> (TRGT.justification_count_c) ) temp;
				