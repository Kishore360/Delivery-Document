SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for Variables_u_request_type' ELSE 'SUCCESS' END as Message from  (
select 
fs_row_id,
f.row_id
fs_reference_c_id,
lkp.row_key,
f.reference_c_key 
from
(
select 
concat(row_id,reference_c_id) fs_row_id,

dd.reference_c_id fs_reference_c_id

from
(
select concat(X.sys_id,'~',X.request_item) as row_id,
qa.sourceinstance as source_id,
CASE WHEN lvl.variable_type!='Reference' AND c.label='Select Box' then COALESCE (qc.sys_id,'UNSPECIFIED')
                when lvl.variable_type='Reference' AND q.reference not in ('sys_user','cmn_location','cmn_department') then coalesce(qa.value,'UNSPECIFIED') ELSE 'UNSPECIFIED' end  as reference_c_id
			
				
from
(SELECT qa.sys_id,case when qa.cdctype='D' then 'Y' else 'N' end as soft_deleted_flag, b.request_item from asu_mdsdb.sc_item_option_final qa 
inner join  asu_mdsdb.sc_item_option_mtom_final b
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance
UNION
SELECT qa.sys_id, 'N' as soft_deleted_flag, b.request_item from asu_mdsdb.sc_item_option_final qa 
inner join  asu_mdsdb.sc_item_option_mtom_final b
on qa.sys_id=b.sc_item_option and qa.sourceinstance = b.sourceinstance
)X
join asu_mdsdb.sc_item_option_final qa
on X.sys_id=qa.sys_id
left join asu_mdsdb.question_final q
on qa.item_option_new=q.sys_id and qa.sourceinstance=q.sourceinstance
join asu_mdsdb.sys_choice_final c
on q.type=c.value and c.element='type'
and c.name like 'question'
left join asu_mdsdb.question_choice_final qc
on qa.value=qc.value and qa.item_option_new=qc.question
and qa.sourceinstance=qc.sourceinstance
left join asu_workdb.lsm_ls_variable_list lvl
on q.sys_id=lvl.row_id and  q.sourceinstance=lvl.source_id
join asu_workdb.lsm_ls_variable_datatype lvd
on c.label = lvd.variable_type
where lvl.table_name='request_item') dd ) fs 
join asu_mdwdb.f_request_item_variable_c f
on fs.fs_row_id=f.row_id 
join asu_mdwdb.d_variable_lov_c lkp
on fs2.reference_c_id=lkp.row_id and fs2.source_id=lkp.source_id
where lkp.row_key<>f.reference_c_key 
)A ;

