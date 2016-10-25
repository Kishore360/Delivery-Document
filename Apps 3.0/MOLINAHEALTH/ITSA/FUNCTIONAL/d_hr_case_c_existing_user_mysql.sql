select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few Record Ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Record Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result
from 
(select 

case when COALESCE(src.existing_user_id,'UNSPECIFIED') <> COALESCE(trgt.existing_user,'UNSPECIFIED') then src.record_id else '' end as failures,

case when COALESCE(src.existing_user_id,'UNSPECIFIED') <> COALESCE(trgt.existing_user,'UNSPECIFIED') then 1 else 0 end as failures_cnt

from molinahealth_mdsdb.u_hr_case_ext_final src
left join molinahealth_mdwdb.d_hr_case_c trgt on trgt.row_id = src.record_id and trgt.source_id = src.sourceinstance) fnl ;