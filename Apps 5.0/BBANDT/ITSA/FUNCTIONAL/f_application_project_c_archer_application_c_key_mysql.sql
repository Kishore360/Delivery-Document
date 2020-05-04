select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_project_c.archer_application_c_key'  ELSE 'SUCCESS'  END as Message
from  bbandt_mdsdb.BBT_APP_DATA_NUMERIFY_final a11
join bbandt_mdwdb.f_application_project_c a12 on 
(concat(a11.APPLICATION_DATABASE_ID,'~',a11.ASSOCIATED_Database_Investment_ID,'~',a11.QTRR_Database_Investment_ID)=a12.row_id 
and a11.sourceinstance=a12.source_id)
join bbandt_mdwdb.d_archer_application_c a13
on (COALESCE(CONCAT('APPID-',UPPER(a11.APPLICATION_ARCHER_ID)),'UNSPECIFIED')=a13.row_id )
where coalesce(a13.row_key, case when a11.APPLICATION_ARCHER_ID is null then 0 else -1 end)<>a12.archer_application_c_key;