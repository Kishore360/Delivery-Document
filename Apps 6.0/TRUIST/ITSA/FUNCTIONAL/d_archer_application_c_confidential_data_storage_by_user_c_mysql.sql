select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from truist_mdsdb.app_vwarchertonumerifyfeed_final a
join truist_mdwdb.d_archer_application_c b
on a.application_id=b.row_id and a.sourceinstance=b.source_id
where COALESCE(a.confidential_data_storage_by_user,'UNSPECIFIED')<>b.confidential_data_storage_by_user_c
and a.cdctype='X';