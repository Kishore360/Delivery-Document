SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_close_code_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM  #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP
on COALESCE(concat('CLOSE_CODE~','CHANGE_REQUEST~',SRC.status_reason),'UNSPECIFIED')=LKP.row_id
and LKP.source_id=TRGT.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.status_reason IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.change_close_code_key ,'')
