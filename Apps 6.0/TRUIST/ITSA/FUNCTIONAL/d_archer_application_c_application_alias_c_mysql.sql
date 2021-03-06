select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from (select * from truist_mdsdb.app_vwarchertonumerifyfeed_final where cdctype<>'D') a
join truist_mdwdb.d_archer_application_c b
on a.application_id=b.row_id and a.sourceinstance=b.source_id
where COALESCE(a.application_alias,'UNSPECIFIED')<>b.application_alias_c;