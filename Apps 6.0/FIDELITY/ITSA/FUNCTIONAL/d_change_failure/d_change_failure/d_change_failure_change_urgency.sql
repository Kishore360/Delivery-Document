select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_urgency' ELSE 'SUCCESS' END as Message
from (SELECT * FROM qa_aa_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM aa_qa_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
left outer join aa_qa_mdwdb.d_lov lov 
on concat('URGENCY~CHANGE_REQUEST~',urgency)=lov.row_id
AND SRC.sourceinstance = lov.source_id 
 where coalesce(lov.dimension_name,'UNSPECIFIED') <> coalesce(TRGT.change_urgency,''); 