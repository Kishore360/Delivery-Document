set @crkey = null;
set @rank = -1;
select SQ.change_request_key, SQ.created_on, SQ.task_wh_type, SQ.task_attribute_wh_name, SQ.primary_sequence_id, SQ.primary_sequence_id1

from (
select TRGT.change_request_key, TRGT.created_on, TRGT.task_wh_type, TRGT.task_attribute_wh_name, TRGT.primary_sequence_id,
case when (if(@crkey != TRGT.change_request_key, @rank := 0, @rank := @rank + @increment)) is null then null
when (@crkey := TRGT.change_request_key) is null then null
else @rank end as primary_sequence_id1

from (select TRGT.change_request_key, TRGT.created_on, TRGT.task_wh_type, TRGT.task_attribute_wh_name, TRGT.row_key, TRGT.primary_sequence_id
FROM pan6_mdwdb.f_change_request_activity TRGT
WHERE TRGT.task_wh_type = 'change_request' and TRGT.task_attribute_wh_name = 'state' and TRGT.change_request_key != -1
order by TRGT.change_request_key, TRGT.created_on, TRGT.task_wh_type, TRGT.task_attribute_wh_name, TRGT.row_key) TRGT, (select @increment:= 1, @crkey:=null) v 
order by TRGT.change_request_key, TRGT.created_on, TRGT.row_key) SQ
where SQ.primary_sequence_id<>SQ.primary_sequence_id1;

select * from pan6_mdwdb.f_change_request_activity where change_request_key = 388