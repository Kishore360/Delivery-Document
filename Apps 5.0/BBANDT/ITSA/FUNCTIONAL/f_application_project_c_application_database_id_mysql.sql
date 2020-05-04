select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_project_c.application_database_id'  ELSE 'SUCCESS'  END as Message
from  bbandt_mdsdb.BBT_APP_DATA_NUMERIFY_final a11
join bbandt_mdwdb.f_application_project_c a12 on 
(concat(a11.APPLICATION_DATABASE_ID,'~',a11.ASSOCIATED_Database_Investment_ID,'~',a11.QTRR_Database_Investment_ID)=a12.row_id 
and a11.sourceinstance=a12.source_id)
where a11.APPLICATION_DATABASE_ID<>a12.application_database_id;