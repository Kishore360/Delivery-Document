SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_sap_backup_sow_compliance_c.success_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_sbsc_sap_backup_sow_compliance_final src
left join wpl_mdwdb.d_sap_backup_sow_compliance_c trgt
on    concat(COALESCE(src.nodename,'UNSPECIFIED'),'~',REPLACE(COALESCE(src.completeddatetime,'UNSPECIFIED'),'-',''))=trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and case when src.success=1 then true else false end <>trgt.success_c)ma
;