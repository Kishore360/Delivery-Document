
				
				
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.ci_grouped_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

  ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
join  ntrust_mdwdb.d_internal_organization LKP
on coalesce('INTERNAL_CONTACT~',SRC.assignment_group)=LKP.row_id
 
WHERE coalesce(LKP.organization_name,'UNSPECIFIED') <> (TRGT.ci_grouped_c) and TRGT.current_flag='Y' and SRC.cdctime<=TRGT.dw_inserted_on ) temp;