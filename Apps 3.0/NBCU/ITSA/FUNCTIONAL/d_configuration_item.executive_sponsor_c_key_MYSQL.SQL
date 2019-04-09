SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt>0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
 (select count(1) as cnt from nbcu_mdsdb.cmdb_ci_appl_final src 
join nbcu_mdwdb.d_configuration_item trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
LEFT OUTER JOIN nbcu_mdwdb.d_internal_contact lkp 
ON COALESCE(concat('INTERNAL_CONTACT~',src.u_executive_sponsor),'UNSPECIFIED')=lkp.row_id   AND src.sourceinstance=lkp.source_id
where coalesce(lkp.row_key,case when src.u_executive_sponsor is null then 0 else -1 end)<>trgt.executive_sponsor_c_key 
and trgt.soft_deleted_flag<>'Y')ma