select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from bbandt_mdsdb.app_vwarchertonumerifyfeed_final a
join bbandt_mdwdb.d_archer_application_c b
on a.application_id=b.row_id and a.sourceinstance=b.source_id
where COALESCE(a.Business_Information_Officer_BIO_Unit,'UNSPECIFIED')<>b.business_information_officer_bio_unit_c
and a.cdctype='X';