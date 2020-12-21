SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.keyword_subject_area_c' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
png_mdwdb.d_rita_application_ext_c ds
join
(
select app_hexid, sourceinstance,count(1) 
,group_concat(distinct KEYWORD_NAME order by KEYWORD_ID) keyword_subject_area
from png_mdsdb.pg_mega_pgb_app_keyword_final 
where app_hexid is not null and KEYWORD_ID is not null and KEYWORD_ID<>'' and keyword_name like 'SA%' and cdctype='X'
group by 1,2
) as lsa
on ds.mega_id_c=lsa.app_hexid and ds.source_id=lsa.sourceinstance
where
keyword_subject_area_c<>COALESCE(lsa.keyword_subject_area,'UNSPECIFIED');
) temp;




  

