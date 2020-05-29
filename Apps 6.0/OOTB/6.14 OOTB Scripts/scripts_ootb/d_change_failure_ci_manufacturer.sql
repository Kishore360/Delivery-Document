
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.ci_manufacturer' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
left join #MDS_TABLE_SCHEMA.cmdb_ci_final cmdb_ci
on cmdb_ci.sys_id = SRC.cmdb_ci
left join #MDS_TABLE_SCHEMA.core_company_final ci_manu
on cmdb_ci.manufacturer = ci_manu.sys_id
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(ci_manu.name,'UNSPECIFIED') <> COALESCE(TRGT.ci_manufacturer,'')
