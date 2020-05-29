SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.country_code' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left join(select * from #MDS_TABLE_SCHEMA.hlx_ctm_people_final)SRC1
on SRC.aslogid=SRC1.remedy_login_id
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC1.site_country,'UNSPECIFIED') <> COALESCE(TRGT.country_code,'')
