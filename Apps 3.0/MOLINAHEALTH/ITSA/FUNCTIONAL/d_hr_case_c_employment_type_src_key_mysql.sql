select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few record ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Record Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (record_id || employment_type) - ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (record_id || employment_type) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

else 'Success. All warehouse records are matching with source.' end Result

from  
(select   
case when src.employment_type is not null and lkp.row_id is null then concat(src.record_id,' || ',src.employment_type) else '' end as warnings,

case when src.employment_type is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,

case when COALESCE(lkp.row_key,CASE WHEN src.employment_type IS NULL THEN 0 else -1 end) <> COALESCE(trgt.employment_type_src_key,0)  then src.record_id else '' end as failures,

case when COALESCE(lkp.row_key,CASE WHEN src.employment_type IS NULL THEN 0 else -1 end) <> COALESCE(trgt.employment_type_src_key,0) then 1 else 0 end as failures_cnt
 
from molinahealth_mdsdb.u_hr_case_ext_final src 
left join molinahealth_mdwdb.d_hr_case_c trgt on src.record_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join molinahealth_mdwdb.d_lov lkp on concat('EMPLOYEE_TYPE~HR_CASE_C~~~',upper(src.employment_type))=  lkp.row_id and lkp.dimension_class = 'EMPLOYEE_TYPE~HR_CASE_C')fnl;