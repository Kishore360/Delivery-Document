

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.pg_delegate_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.sc_req_item_final SRC 
LEFT JOIN png_mdsdb.sys_user_group_final SRC1 ON (SRC.assignment_group=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance)
LEFT JOIN png_mdsdb.sys_user_final SRC2 ON (SRC1.u_pg_delegate=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance)
JOIN png_mdwdb.f_request_item TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_internal_organization LKP1 ON (SRC1.sys_id=right(LKP1.row_id,32) AND SRC1.sourceinstance=LKP1.source_id)
JOIN png_mdwdb.d_internal_contact LKP ON CONCAT('INTERNAL_CONTACT~',SRC2.sys_id)=LKP.row_id AND SRC2.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.name is NULL THEN 0 ELSE -1 END)<>LKP1.pg_delegate_c_key

) temp;


 