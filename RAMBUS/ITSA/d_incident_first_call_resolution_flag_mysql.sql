
select (case when count(1)=0 then 'SUCCESS' else 'FAILURE' end) dataValidation from (
select (case when first_call_resolution_flag = 'Y' then 'SUCCESS' else 'FAILURE' end) result from rambus_mdwdb.d_incident where
opened_on >= closed_on - interval 1 hour and multiple_assignment_flag = 'N' and if(DAYNAME(opened_on) = 'saturday',0, if(DAYNAME(opened_on) = 'sunday' and cast(opened_on as time) < '18:00:00',0,if(DAYNAME(closed_on) = 'friday' and cast(closed_on as time) > '18:00:00',0,1))) = 1
) res where res.result = 'FAILURE';

