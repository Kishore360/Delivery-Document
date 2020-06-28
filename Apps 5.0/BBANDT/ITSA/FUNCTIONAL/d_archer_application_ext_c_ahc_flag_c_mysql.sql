select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_archer_application_ext_c_ahc_flag_c'  ELSE 'SUCCESS'  END as Message
from bbandt_mdsdb.us_archer_ext_final a
join bbandt_mdwdb.d_archer_application_ext_c b
on a.Application_ID=b.row_id and a.sourceinstance=b.source_id
where COALESCE(a.AHC_Flag,'UNSPECIFIED')<>b.ahc_flag_c
and a.cdctype='X';