SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.is_new_flag' ELSE 'SUCCESS' END as Message
 
-- select distinct SRC.asset,case when SRC.sys_created_on=AST.sys_created_on then 'Y' else 'N'  end as is_new_flag
from ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC
left join
(select asset, min(sys_created_on ) as sys_created_on
from ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D')
group by asset )AST
on AST.asset=SRC.asset

LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

where 
 (case when SRC.asset is  null then null
 when SRC.asset is not null and SRC.sys_created_on=AST.sys_created_on then 'Y' 
 else 'N'  end) <> coalesce(TRGT.is_new_flag,'')
 
