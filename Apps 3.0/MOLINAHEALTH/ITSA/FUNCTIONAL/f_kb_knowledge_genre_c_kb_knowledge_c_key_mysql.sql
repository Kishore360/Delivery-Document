select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(src_not_null_count) <> 0 and sum(lkp_not_null_count) = 0 then 'Failed. Lookup does not have any data.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (row_id || knowledge_id) - ',group_concat(distinct warnings))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (row_id || knowledge_id) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count - ',sum(src_not_null_count),' Target Count - ',sum(trgt_not_null_count)) end Result

from  
(select 

case when src.knowledge_id is not null then 1 else 0 end as src_not_null_count,

case when trgt.kb_knowledge_c_key <> 0 then 1 else 0 end as trgt_not_null_count,

case when lkp.row_key is not null then 1 else 0 end as lkp_not_null_count,
  
case when src.knowledge_id is not null and lkp.row_id is null then concat(src.row_id,' || ',src.knowledge_id) else '' end as warnings,

case when src.knowledge_id is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,

case when COALESCE(lkp.row_key,CASE WHEN src.knowledge_id IS NULL THEN 0 else -1 end) <> COALESCE(trgt.kb_knowledge_c_key,0)  then src.row_id else '' end as failures,

case when COALESCE(lkp.row_key,CASE WHEN src.knowledge_id IS NULL THEN 0 else -1 end) <> COALESCE(trgt.kb_knowledge_c_key,0) then 1 else 0 end as failures_cnt

from 
( SELECT CONCAT(sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(u_genres), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id, sourceinstance AS source_id,	sys_id as knowledge_id
	FROM molinahealth_mdsdb.kb_knowledge_final inc
	CROSS JOIN
	  (SELECT a.N + b.N * 10 + 1 AS n
		FROM
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
		ORDER BY n) n
	 ON n.n <= 1 + (LENGTH(COALESCE(TRIM(u_genres),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(u_genres),'UNSPECIFIED'), ',', ''))) ) src
left join molinahealth_mdwdb.f_kb_knowledge_genre_c trgt on src.row_id = trgt.row_id and src.source_id = trgt.source_id
left join molinahealth_mdwdb.d_kb_knowledge_c lkp on src.knowledge_id = lkp.row_id and src.source_id = lkp.source_id) fnl ;