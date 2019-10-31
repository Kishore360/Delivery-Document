SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 
'MDS to DWH data validation failed for d_change_failure.failure_flag_c' ELSE 'SUCCESS' END as Message 
FROM


 keybank_mdwdb.d_change_failure d 
JOIN keybank_mdwdb.d_change_request d1 
on d.change_request_key = d1.row_key
 
LEFT JOIN keybank_mdwdb.d_lov lov on lov.row_key=d.change_state_src_key

LEFT JOIN keybank_mdwdb.d_lov lov1 on lov1.row_key=d1.substate_c_key    
 
left join keybank_mdwdb.d_lov lov2 on lov2.row_key=d1.change_request_backout_c_key

where
 d.failure_flag_c <>


(case when lov.dimension_name in('Closed','Post-Implementation Review') 
and lov1.dimension_name in
('Backed Out','ELF','Failed') and lov2.dimension_name<>'Not Attempted' then 'Y' 
when lov.dimension_name in('Closed','Post-Implementation Review') and
 
lov1.dimension_name in('Partial Success','Successful','Closed Successful') then 'N'
 when 
 lov.dimension_name in('Closed','Post-Implementation Review') and 

lov1.dimension_name in('Cancelled','Closed Incomplete','Not Attempted','UNSPECIFIED') OR

lov2.dimension_name='Not Attempted' or lov.dimension_name in('Open','Planning','Work in Progress') then 'X' end)
and d.current_flag='Y' and d1.cdctype='X'

