
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.business_service_vendor' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
left join #MDS_TABLE_SCHEMA.cmdb_ci_service_final ci_ser
on ci_ser.sys_id = SRC.business_service
left join #MDS_TABLE_SCHEMA.core_company_final core_cmp
on core_cmp.sys_id = ci_ser.vendor
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
WHERE COALESCE( core_cmp.name ,'UNSPECIFIED')<> COALESCE(TRGT.business_service_vendor ,'')


