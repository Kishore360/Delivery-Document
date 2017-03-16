select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('FAILURE. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('FAILURE. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' , Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when src.u_kb_genre is not null then 1 else 0 end as src_not_null_count,

case when trgt.dimension_name is not null and trgt.dimension_name <> 'UNSPECIFIED' then 1 else 0 end as trgt_not_null_count,

case when COALESCE(TRIM(Replace(Replace(Replace(src.u_kb_genre,'\t',''),'\n',''),'\r','‌​')) ,'UNSPECIFIED') <> COALESCE(trgt.dimension_name,'UNSPECIFIED') then src.sys_id else '' end as failures,

case when COALESCE(TRIM(Replace(Replace(Replace(src.u_kb_genre,'\t',''),'\n',''),'\r','‌​')) ,'UNSPECIFIED') <> COALESCE(trgt.dimension_name,'UNSPECIFIED') then 1 else 0 end as failures_cnt

from molinahealth_mdsdb.u_kb_genre_final src
left join molinahealth_mdwdb.d_lov trgt on trgt.row_id = COALESCE(concat('GENRE~KB_KNOWLEDGE~~~',src.sys_id),'UNSPECIFIED') and trgt.source_id = src.sourceinstance) fnl ;