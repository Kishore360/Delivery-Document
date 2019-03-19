select  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_expense_item.short_desc' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt from pdchs_mdsdb.fm_expense_line_final SRC
left join pdchs_mdwdb.d_expense_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.short_description,'UNSPECIFIED')<>TRGT.short_desc
)temp1;

