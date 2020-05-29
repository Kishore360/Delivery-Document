SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_sap_backup_sow_compliance_c.wlc_model_c_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_sbsc_sap_backup_sow_compliance_final src
left join wpl_mdwdb.d_sap_backup_sow_compliance_c trgt
on  concat(COALESCE(src.nodename,'UNSPECIFIED'),'~',REPLACE(COALESCE(src.completeddatetime,'UNSPECIFIED'),'-',''))=trgt.row_id and src.sourceinstance=trgt.source_id
join wpl_mdwdb.d_lov lkp on COALESCE( CONCAT('MODULE~SAP_BACKUP~',src.sapmodule),'UNSPECIFIED') =lkp.row_id and src.sourceinstance=lkp.source_id
where src.cdctype<>'D' and coalesce(lkp.row_key,case when src.sapmodule is null then 0 else -1 end)<>trgt.module_c_key)ma
;