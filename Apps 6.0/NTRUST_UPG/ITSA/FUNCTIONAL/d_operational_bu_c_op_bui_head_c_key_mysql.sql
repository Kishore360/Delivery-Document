		 

		 
	


SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal.opened_by_service_desk_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.u_operational_business_unit_final SRC
   join ntrust_mdwdb.d_operational_bu_c TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
  left JOIN ntrust_mdwdb.d_internal_contact TRGT2 ON coalesce(concat('INTERNAL_CONTACT~',SRC.u_op_bui_head),'UNSPECIFIED')=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id
where coalesce(TRGT2.row_key,case when SRC.u_op_bui_head is null then 0 else -1 end)
         <> TRGT.op_bui_head_c_key and SRC.cdctype='X' )temp;

		 
	