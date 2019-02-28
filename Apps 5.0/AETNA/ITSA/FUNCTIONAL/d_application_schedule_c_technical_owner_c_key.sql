 select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_application_schedule_c.Technical_Owner_c_key'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.us_application_schedule_c_final a11
 join aetna_mdwdb.d_application_schedule_c a12 on 
 (concat(a11.Application_SYS_ID,'~',a11.DRClass,'~',a11.Day,'~',a11.Start,'~',a11.End,'~','1')=a12.row_id and a11.sourceinstance=a12.source_id)
join aetna_mdwdb.d_internal_contact a13
on (a11.Technical_Owner_ID=a13.user_name and a11.sourceinstance=a13.source_id)
where coalesce(a13.row_key, case when a11.Technical_Owner is null then 0 else -1 end)<>a12.Technical_Owner_c_key
union
select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_application_schedule_c.Technical_Owner_c_key'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.us_application_schedule_c_final a11
 join aetna_mdwdb.d_application_schedule_c a12 on 
 (concat(a11.Application_SYS_ID,'~',a11.DRClass,'~',a11.Day,'~',a11.Start,'~',a11.End,'~','2')=a12.row_id and a11.sourceinstance=a12.source_id)
join aetna_mdwdb.d_internal_contact a13
on (a11.Technical_Owner_ID=a13.user_name and a11.sourceinstance=a13.source_id)
where coalesce(a13.row_key, case when a11.Technical_Owner is null then 0 else -1 end)<>a12.Technical_Owner_c_key
union
select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_application_schedule_c.Technical_Owner_c_key'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.us_application_schedule_c_final a11
 join aetna_mdwdb.d_application_schedule_c a12 on 
 (concat(a11.Application_SYS_ID,'~',a11.DRClass,'~',a11.Day,'~',a11.Start,'~',a11.End,'~','3')=a12.row_id and a11.sourceinstance=a12.source_id)
join aetna_mdwdb.d_internal_contact a13
on (a11.Technical_Owner_ID=a13.user_name and a11.sourceinstance=a13.source_id)
where coalesce(a13.row_key, case when a11.Technical_Owner is null then 0 else -1 end)<>a12.Technical_Owner_c_key
union
select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_application_schedule_c.Technical_Owner_c_key'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.us_application_schedule_c_final a11
 join aetna_mdwdb.d_application_schedule_c a12 on 
 (concat(a11.Application_SYS_ID,'~',a11.DRClass,'~',a11.Day,'~',a11.Start,'~',a11.End,'~','4')=a12.row_id and a11.sourceinstance=a12.source_id)
join aetna_mdwdb.d_internal_contact a13
on (a11.Technical_Owner_ID=a13.user_name and a11.sourceinstance=a13.source_id)
where coalesce(a13.row_key, case when a11.Technical_Owner is null then 0 else -1 end)<>a12.Technical_Owner_c_key
union 
select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_application_schedule_c.Technical_Owner_c_key'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.us_application_schedule_c_final a11
 join aetna_mdwdb.d_application_schedule_c a12 on 
 (concat(a11.Application_SYS_ID,'~',a11.DRClass,'~',a11.Day,'~',a11.Start,'~',a11.End,'~','5')=a12.row_id and a11.sourceinstance=a12.source_id)
join aetna_mdwdb.d_internal_contact a13
on (a11.Technical_Owner_ID=a13.user_name and a11.sourceinstance=a13.source_id)
where coalesce(a13.row_key, case when a11.Technical_Owner is null then 0 else -1 end)<>a12.Technical_Owner_c_key
union
select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_application_schedule_c.Technical_Owner_c_key'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.us_application_schedule_c_final a11
 join aetna_mdwdb.d_application_schedule_c a12 on 
 (concat(a11.Application_SYS_ID,'~',a11.DRClass,'~',a11.Day,'~',a11.Start,'~',a11.End,'~','6')=a12.row_id and a11.sourceinstance=a12.source_id)
join aetna_mdwdb.d_internal_contact a13
on (a11.Technical_Owner_ID=a13.user_name and a11.sourceinstance=a13.source_id)
where coalesce(a13.row_key, case when a11.Technical_Owner is null then 0 else -1 end)<>a12.Technical_Owner_c_key
union
select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for d_application_schedule_c.Technical_Owner_c_key'  ELSE 'SUCCESS'  END as Message
from  aetna_mdsdb.us_application_schedule_c_final a11
 join aetna_mdwdb.d_application_schedule_c a12 on 
 (concat(a11.Application_SYS_ID,'~',a11.DRClass,'~',a11.Day,'~',a11.Start,'~',a11.End,'~','7')=a12.row_id and a11.sourceinstance=a12.source_id)
join aetna_mdwdb.d_internal_contact a13
on (a11.Technical_Owner_ID=a13.user_name and a11.sourceinstance=a13.source_id)
where coalesce(a13.row_key, case when a11.Technical_Owner is null then 0 else -1 end)<>a12.Technical_Owner_c_key;