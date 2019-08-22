


SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select count(1) cnt  from
rogers_mdwdb.d_change_request config 
JOIN rogers_mdsdb.change_request_final ci
on ci.sys_id  = config.row_id and ci.sourceinstance  = config.source_id
left join rogers_mdwdb.d_lov d 
on COALESCE(CONCAT('FAILED_CHANGE','~','CHANGE_REQUEST','~','~','~',UPPER(u_failed_change)),'UNSPECIFIED') =d.row_id
where d.soft_deleted_flag='N' and failed_change_src_c_key <> coalesce(d.row_key,case when u_failed_change is null then 0 else -1 end))a