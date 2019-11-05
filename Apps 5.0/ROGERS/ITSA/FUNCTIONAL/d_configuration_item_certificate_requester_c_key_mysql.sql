SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select count(1) cnt  from
rogers_mdwdb.d_configuration_item config 
JOIN rogers_mdsdb.u_cmdb_ci_ssl_certificate_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
left join rogers_mdwdb.d_internal_contact d 
on COALESCE(CONCAT('INTERNAL_CONTACT~',ci.u_certificate_requestor),'UNSPECIFIED')=d.row_id
where d.soft_deleted_flag='N' and certificate_requester_c_key <> coalesce(d.row_key,case when ci.u_certificate_requestor is null then 0 else -1 end)
and config.CDCTYPE='X' and ci.cdctype='X' and d.soft_deleted_flag='N')a