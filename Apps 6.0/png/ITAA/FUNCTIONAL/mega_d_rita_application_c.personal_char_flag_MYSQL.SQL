

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.personal_char_flag' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from png_mdsdb.pg_mega_cmdb_ci_appl_final a
join png_mdwdb.d_rita_application_c b
on (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
join 
(select fa.rita_application_c_key,group_concat(distinct de.data_element_collected), 
case when group_concat(distinct de.data_element_collected) like '%Personal characteristics%' then 'Y' else 'N' end as personal_char_flag
from png_mdwdb.f_rita_application_data_elements_c as fa
inner join png_mdwdb.d_png_ot_data_elements_collected_c as de on fa.png_ot_data_elements_collected_c_key = de.row_key
where fa.soft_deleted_flag = 'N'
group by fa.rita_application_c_key) as c
on (b.row_key=c.rita_application_c_key)
where c.personal_char_flag<>b.personal_char_flag
)temp;






