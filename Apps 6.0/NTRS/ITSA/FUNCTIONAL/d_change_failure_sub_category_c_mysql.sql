
				
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.sub_category_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE  coalesce(SRC.u_subcategory,
                'UNSPECIFIED') <> (TRGT.sub_category_c) and TRGT.current_flag='Y' and SRC.cdctype='X'  and SRC.cdctime<=TRGT.dw_inserted_on ) temp;
				