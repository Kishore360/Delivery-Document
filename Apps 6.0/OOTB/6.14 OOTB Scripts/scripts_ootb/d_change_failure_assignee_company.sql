
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.assignee_company' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
ON concat('INTERNAL_CONTACT~',SRC.assigned_to) =LKP.row_id 
	AND SRC.sourceinstance =LKP.source_id 
left join #DWH_TABLE_SCHEMA.d_supplier sup
on sup.row_key=LKP.vendor_key
WHERE COALESCE(sup.supplier_name,'UNSPECIFIED')<> COALESCE(TRGT.assignee_company,'')

