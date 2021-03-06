  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.contact_key' ELSE 'SUCCESS' END as Message
from    watson_mdsdb.sn_customerservice_case_final src
left join watson_mdwdb.d_internal_contact lkp 
on concat('INTERNAL_CONTACT~',contact) =lkp.row_id
join watson_mdwdb.f_case f 
on src.sys_id=f.row_id and src.sourceinstance=f.source_id
where f.contact_c_key <>coalesce(lkp.row_key,case when contact is null then 0 else -1 end );




