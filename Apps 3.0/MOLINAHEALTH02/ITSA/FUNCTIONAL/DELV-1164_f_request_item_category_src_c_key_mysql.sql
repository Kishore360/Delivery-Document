SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from molinahealth_mdsdb.sc_req_item_final a
join molinahealth_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join molinahealth_mdsdb.u_hr_case_final src1
on a.parent=src1.sys_id and a.sourceinstance=src1.sourceinstance 
left join molinahealth_mdwdb.d_lov lov
on CONCAT('U_HR_CASE_CATEGORY~SC_REQ_ITEM','~','~','~',src1.u_category)=lov.row_id and src1.sourceinstance=lov.source_id
where coalesce(lov.row_key,case when src1.u_category is null then 0 else -1 end)<>category_src_c_key