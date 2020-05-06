select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from bbandt_mdsdb.us_archer_ext_final archer_ext
join bbandt_mdwdb.d_archer_application_ext_c b
on archer_ext.Application_ID=b.row_id and archer_ext.sourceinstance=b.source_id
where case 
                    when archer_ext.Application_Name='' 
                    or archer_ext.Application_Name is null then 'UNSPECIFIED' 
                    else archer_ext.Application_Name 
                end <>b.application_name_c
and archer_ext.cdctype='X';