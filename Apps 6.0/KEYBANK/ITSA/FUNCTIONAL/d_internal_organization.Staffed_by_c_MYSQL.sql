
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.staffed_by_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM keybank_mdsdb.sys_user_group_final SRC 
left JOIN keybank_mdwdb.d_internal_organization TRGT ON
 (concat('GROUP~',SRC.sys_id)=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 left join keybank_mdsdb.core_company_final LKP on LKP.sys_id=SRC.u_staffed_by
WHERE coalesce(LKP.name,'UNSPECIFIED')<>TRGT.staffed_by_c
AND SRC.cdctype='X' and TRGT.current_flag='Y') temp; 

