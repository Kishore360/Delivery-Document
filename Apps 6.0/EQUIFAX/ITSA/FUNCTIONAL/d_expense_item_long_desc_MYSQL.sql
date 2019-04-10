SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'Data mismatch for d_expense_item.long_desc' ELSE 'SUCCESS' END as Message 
from equifax_mdsdb.cmdb_model_final a
join equifax_mdwdb.d_product_model b
on (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
where coalesce(a.comments,'UNSPECIFIED')<>b.long_desc
and a.cdctype<>'D';