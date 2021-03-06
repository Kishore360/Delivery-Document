  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.changed_on' ELSE 'SUCCESS' END as Message
from    watson_mdsdb.sn_customerservice_case_final src
left join watson_mdwdb.d_internal_contact lkp on concat('INTERNAL_CONTACT~',assigned_to) =lkp.row_id
join watson_mdwdb.f_case f on src.sys_id=f.row_id and src.sourceinstance=f.source_id
join watson_mdwdb.f_case_activity trgt on 
trgt.case_key=f.case_key and f.source_id=trgt.source_id
where trgt.assigned_to_key =coalesce(lkp.row_key,case when assigned_to is null then 0 else -1 end );




