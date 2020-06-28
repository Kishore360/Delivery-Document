SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_internal_contact_cost_center_c_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from truist_mdsdb.sys_user_final SRC 
LEFT JOIN truist_mdwdb.d_internal_contact TRGT 
ON (concat('INTERNAL_CONTACT~',SRC.sys_id) =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
JOIN truist_mdwdb.d_cost_center LKP
ON ( SRC.cost_center= LKP.row_id AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cost_center IS NULL THEN 0 else -1 end)<>
TRGT.cost_center_key and SRC.CDCTYPE<>'D' and TRGT.soft_deleted_flag='N')ma;  



