select 
case 

when sum(src_not_null_count) = 0 then 'Success. Source does not have any data. All are nulls.'

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else CONCAT('Success. All warehouse records are matching with source. Source Count : ',sum(src_not_null_count),' ; Target Count : ',sum(trgt_not_null_count)) end Result

from 
(select 
case when src.genres is not null then 1 else 0 end as src_not_null_count,

case when trgt.genres is not null and trgt.genres <> 'UNSPECIFIED' then 1 else 0 end as trgt_not_null_count,

case when COALESCE(src.genres,'UNSPECIFIED') <> COALESCE(trgt.genres,'UNSPECIFIED') then src.sys_id else '' end as failures,

case when COALESCE(src.genres,'UNSPECIFIED') <> COALESCE(trgt.genres,'UNSPECIFIED') then 1 else 0 end as failures_cnt
from 
(SELECT kb.sys_id ,
			kb.sourceinstance ,			
				group_concat(genre.u_kb_genre) AS genres
	FROM molinahealth_mdsdb.kb_knowledge_final kb 
	CROSS JOIN
	  (SELECT a.N + b.N * 10 + 1 AS n
		FROM
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
		ORDER BY n) n
	 ON n.n <= 1 + (length(trim(u_genres)) - length(replace(trim(u_genres), ',', '')))
	 LEFT JOIN molinahealth_mdsdb.u_kb_genre_final genre 
	  ON substring_index(substring_index(trim(u_genres), ',', n.n), ',', -1) = genre.sys_id
   GROUP BY 1,2) src
left join molinahealth_mdwdb.d_kb_knowledge_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance) fnl ;