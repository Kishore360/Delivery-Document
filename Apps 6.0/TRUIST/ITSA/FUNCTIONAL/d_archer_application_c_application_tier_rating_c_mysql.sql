select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
-- select a.application_id,b.row_id,a.application_tier_rating,b.application_tier_rating_c
from truist_mdsdb.app_vwarchertonumerifyfeed_final a
join truist_mdwdb.d_archer_application_c b
on a.application_id=b.row_id and a.sourceinstance=b.source_id
where COALESCE(a.application_tier_rating,'UNSPECIFIED')<>b.application_tier_rating_c
and a.cdctype='X';