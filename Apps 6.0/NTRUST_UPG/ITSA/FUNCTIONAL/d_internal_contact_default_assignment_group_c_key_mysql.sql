
SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal.opened_by_service_desk_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.sys_user_final SRC
JOIN
                    ntrust_mdsdb.core_company_final core_company 
                        ON SRC.sourceinstance=core_company.sourceinstance 
                        AND core_company.sys_id=SRC.company 
 JOIN ntrust_mdwdb.d_internal_contact TRGT2 ON coalesce(concat('INTERNAL_CONTACT~',SRC.sys_id),'UNSPECIFIED')=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id
  join ntrust_mdwdb.d_internal_organization TRGT
 on coalesce(concat('GROUP~',SRC.u_default_support_group),'UNSPECIFIED')=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.row_key,case when SRC.u_default_support_group is null then 0 else -1 end)
         <> TRGT2.default_assignment_group_c_key and SRC.cdctype='X' )temp;
		 
	