SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
 -- select SRC1.number,COALESCE(LKP.row_key,CASE WHEN SRC.vendors IS NULL THEN 0 else -1 end),(TRGT.vendor_c_key)
from(
select  src.sys_id , trgt.row_id ,purchase_date_c , CASE WHEN src.purchase_date > df.lastupdated THEN  convert_tz(src.sys_created_on,'GMT','America/New_York') 
ELSE  convert_tz(src.purchase_date,'GMT','America/New_York') END
from  rogers_mdsdb.cmdb_ci_final src 
left join rogers_mdwdb.d_configuration_item trgt on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN (
select source_id,max(lastupdated) as lastupdated from  rogers_mdwdb.d_o_data_freshness
group by source_id
) df ON trgt.source_id = df.source_id
where 
purchase_date_c <> CASE WHEN src.purchase_date > df.lastupdated THEN  convert_tz(src.sys_created_on,'GMT','America/New_York') 
ELSE  convert_tz(src.purchase_date,'GMT','America/New_York') END
and src.CDCTYPE='X')a