
		 

	  
		  SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal.opened_by_service_desk_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.sys_user_group_final SRC
join  ntrust_mdwdb.d_internal_organization TRGT
 on coalesce(concat('GROUP~',SRC.sys_id),'UNSPECIFIED')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
  join ntrust_mdwdb.d_operational_bu_c LKP on SRC.u_op_unit=LKP.row_id
where coalesce(LKP.row_key,case when SRC.u_op_unit is null then 0 else -1 end)
         <>TRGT.op_unit_c_key and SRC.cdctype='X' )temp;
		 
