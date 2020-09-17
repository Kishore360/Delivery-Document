

SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.u_operational_business_unit_final SRC
LEFT JOIN  ntrust_mdwdb.d_operational_bu_c TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
left join  ntrust_mdwdb.d_internal_contact dinc on concat('INTERNAL_CONTACT~',u_op_bui_head)=dinc.row_id
where (dinc.full_name)<>TRGT2.op_bui_head_name_c and SRC.cdctype='X') temp;