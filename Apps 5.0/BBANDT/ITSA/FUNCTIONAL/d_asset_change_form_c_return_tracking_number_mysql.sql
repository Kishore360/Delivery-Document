select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_asset_change_form_c_return_tracking_number'  ELSE 'SUCCESS'  END as Message
from bbandt_mdsdb.u_asset_change_form_final a
join bbandt_mdwdb.d_asset_change_form_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_return_tracking_number <>b.return_tracking_number
and a.cdctype='X';