select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from bbandt_mdsdb.app_vwarchertonumerifyfeed_final a
join bbandt_mdwdb.d_archer_application_c b
on a.application_id=b.row_id and a.sourceinstance=b.source_id
where COALESCE(a.Organization_of_Technical_Manager,'UNSPECIFIED')<>b.organization_of_technical_manager_c
and a.cdctype='X';