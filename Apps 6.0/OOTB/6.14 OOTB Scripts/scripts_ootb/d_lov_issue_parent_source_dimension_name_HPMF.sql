SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_lov_issue.parent_source_dimension_name' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_knta_lookups_nls_final  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_lov TRGT
on CONCAT(CASE 
WHEN UPPER(SRC.LOOKUP_TYPE)='PMO - ISSUE IMPACT LEVEL' THEN 'PROJECT_ISSUE~ESCALATION' 
WHEN UPPER(SRC.LOOKUP_TYPE)='ISSUE_PRIORITY' THEN 'PROJECT_ISSUE~PRIORITY' 
WHEN UPPER(SRC.LOOKUP_TYPE)='PMO - ISSUE TYPE' THEN 'PROJECT_ISSUE~TYPE' END,'~',SRC.LOOKUP_CODE)
=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

where 
UPPER(SRC.DEFINITION_LANGUAGE)='AMERICAN' and UPPER(SRC.LOOKUP_TYPE) 
IN ('PMO - ISSUE IMPACT LEVEL','ISSUE_PRIORITY','PMO - ISSUE TYPE')
and 
coalesce(TRGT.parent_source_dimension_name,'')<>null;