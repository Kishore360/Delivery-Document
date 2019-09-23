SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select count(1) cnt from
rogers6_mdwdb.d_configuration_item config 
JOIN rogers6_mdsdb.u_cmdb_ci_ssl_certificate_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
left join rogers6_mdwdb.d_calendar_date d 
on COALESCE(DATE_FORMAT(CONVERT_TZ (u_valid_to,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')=d.row_id
where valid_to_c_key <> coalesce(d.row_key,case when u_valid_to is null then 0 else -1 end)
 and ci.cdctype='X')a

