select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_asset_change_form_c_life_cycle_status'  ELSE 'SUCCESS'  END as Message
from truist_mdsdb.u_asset_change_form_final a
join truist_mdwdb.d_asset_change_form_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.u_life_cycle_status <>b.life_cycle_status
and a.cdctype='X';