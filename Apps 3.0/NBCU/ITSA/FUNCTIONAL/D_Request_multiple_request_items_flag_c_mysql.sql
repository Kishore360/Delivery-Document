SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.d_request TRGT
 join  nbcu_mdwdb.f_request LKP on TRGT.row_key=LKP.request_key
 join (
select  request_key, assignment_group_key,count(1) as X from nbcu_mdwdb.f_request_item 
group by 1,2 having count(1) >1 ) SRC
on LKP.request_key=SRC.request_key
WHERE case when
SRC.X >1 then 'Y'
else 'N'  end <> TRGT.multiple_request_items_flag_c
