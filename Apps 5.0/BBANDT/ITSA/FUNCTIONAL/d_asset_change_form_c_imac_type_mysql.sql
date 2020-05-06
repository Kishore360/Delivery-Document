select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_asset_change_form_c_imac_type'  ELSE 'SUCCESS'  END as Message
from bbandt_mdsdb.u_asset_change_form_final a
join bbandt_mdwdb.d_asset_change_form_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_imac_type <>b.imac_type
and a.cdctype='X';