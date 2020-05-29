SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_category_src_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )
left join (select * from #DWH_TABLE_SCHEMA.d_lov)LKP
on COALESCE(CONCAT('OPERATIONAL_CATEGORIZATION~','CHANGE_REQUEST~',SRC.categorization_tier_1,'_',SRC.categorization_tier_2),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN concat(SRC.categorization_tier_1,'_',SRC.categorization_tier_2)IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.change_category_src_key ,'')

