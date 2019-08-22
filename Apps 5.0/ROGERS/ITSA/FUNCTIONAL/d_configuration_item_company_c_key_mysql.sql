


SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select count(1) cnt  from
rogers_mdwdb.d_configuration_item config 
JOIN rogers_mdsdb.cmdb_ci_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
left join rogers_mdwdb.d_internal_organization d 
on COALESCE(CONCAT('SUBSIDIARY~',ci.company),'UNSPECIFIED')=d.row_id
where d.soft_deleted_flag='N' and company_c_key <> coalesce(d.row_key,case when ci.company is null then 0 else -1 end))a