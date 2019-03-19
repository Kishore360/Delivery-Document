SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from (
select  substring(a.value,1,10)  SRC , substring(d.v_provide_desc_c,1,10) TRGT
from cardinalhealth_mdsdb.sc_item_option_final a
join
cardinalhealth_mdsdb.sc_item_option_mtom_final c
on a.sys_id=c.sc_item_option AND a.sourceinstance = c.sourceinstance  
join
(select sys_id,sourceinstance from cardinalhealth_mdsdb.item_option_new_final where question_text LIKE '%provide%description%request%'
AND variable_set IN (SELECT sys_id FROM cardinalhealth_mdsdb.item_option_new_set_final WHERE name like '%non_std_request_desc%')) b
on a.item_option_new=b.sys_id AND a.sourceinstance = b.sourceinstance

join
cardinalhealth_mdwdb.d_request_item d
on c.request_item=d.row_id AND c.sourceinstance = d.source_id
where d.v_provide_desc_c is not  null AND (a.value) is not null and d.soft_deleted_flag='N'
)abc
where SRC<>TRGT limit 5)a
