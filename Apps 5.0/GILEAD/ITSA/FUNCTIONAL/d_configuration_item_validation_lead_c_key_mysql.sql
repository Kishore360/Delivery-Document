SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
from  gilead_mdsdb.cmdb_ci_final src
left join gilead_mdwdb.d_internal_contact c 
on CONCAT('INTERNAL_CONTACT~',src.u_validation_lead)=c.row_id and src.sourceinstance=c.source_id
join gilead_mdwdb.d_configuration_item d on sys_id=d.row_id and sourceinstance=d.source_id
where coalesce(c.row_key,case when u_validation_lead is null then 0 else -1 end)  <>validation_lead_c_key;


