SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_case.assigned_date_time' ELSE 'SUCCESS' END as Message
from(select count(1) as cnt from tjxco_mdsdb.sn_customerservice_case_final src
left join(select documentkey,min(sys_created_on) as sys_created_on from tjxco_mdsdb.sys_audit_final src1 where 
tablename='sn_customerservice_case' and fieldname='assigned_to' and cdctype='X' group by documentkey ) lkp on src.sys_id=lkp.documentkey
left join tjxco_mdwdb.d_case trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE convert_tz(lkp.sys_created_on,'GMT','America/New_York')<>trgt.assigned_date_time)ma;

