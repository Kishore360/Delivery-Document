/*For a Request if there is only one request item then populate the assignment_group_key from request item fact  to the request fact since there is source data issue for request assignement_group_key*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Key not properly stamped in f_request from request item fact' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdwdb.f_request SRC
join
(
select  request_key,request_item_key,assignment_group_key,source_id,count(1) from nbcu_mdwdb.f_request_item 
group by request_key having count(1)=1 ) b
on SRC.request_key=b.request_key and SRC.source_id=b.source_id
where SRC.assignment_group_key<>b.assignment_group_key