SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.purchase_date_c' ELSE 'SUCCESS' END as Message 
FROM 
(select sys_id, sourceinstance, purchase_date from aetna_mdsdb.cmdb_ci_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_configuration_item trgt on src.sys_id=trgt.row_id and src.sourceinstance = trgt.source_id
where convert_tz(src.purchase_date,'GMT','America/New_York') <> trgt.purchase_date_c;