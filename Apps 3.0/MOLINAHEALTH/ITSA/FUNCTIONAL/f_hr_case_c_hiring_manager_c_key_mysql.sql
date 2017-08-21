select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few record ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Record Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (record_id || caller_id) - ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (record_id || caller_id) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

else 'Success. All warehouse records are matching with source.' end Result

from  
(select   
case when src.jn1 is not null and lkp.row_id is null then concat(src.record_id,' || ',coalesce(src.caller_id_2,src.caller_id)) else '' end as warnings,

case when src.jn1 is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,

case when COALESCE(lkp.row_key,CASE WHEN src.jn1 IS NULL THEN 0 else -1 end) <> COALESCE(trgt.hiring_manager_c_key,0)  then src.record_id else '' end as failures,

case when COALESCE(lkp.row_key,CASE WHEN src.jn1 IS NULL THEN 0 else -1 end) <> COALESCE(trgt.hiring_manager_c_key,0) then 1 else 0 end as failures_cnt
 
from ( select *,coalesce(caller_id_2,caller_id) as jn1 from molinahealth_mdsdb.u_hr_case_ext_final) src 
join molinahealth_mdwdb.f_hr_case_c trgt on src.record_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join (select *,right(row_id,32) as jn2 from  molinahealth_mdwdb.d_internal_contact) lkp on src.jn1 = lkp.jn2  and src.sourceinstance = lkp.source_id

)fnl;
