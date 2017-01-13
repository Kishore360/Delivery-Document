
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message

 FROM  usf_mdsdb.u_enrollment_terms_final src
 join usf_mdwdb.d_enrollment_period_c trgt on sys_id=row_id and sourceinstance=source_id
 join usf_mdwdb.d_calendar_date d on COALESCE(DATE_FORMAT(u_start_date,'%Y%m%d'),'UNSPECIFIED')=d.row_id
WHERE  mod_count<>mod_count or 
effective_from<>effective_from or 
 src.u_academic_term_desc<>trgt.u_academic_term_desc or 
current_flag<>'Y'
or src.u_academic_period<>trgt.u_academic_period
or deleted_on<>deleted_on
or trgt.year_start_date_key<>coalesce(CONCAT(LEFT(d.row_key,4),'0101'),case when u_start_date is null then 0 else -1 end )
or effective_to<> '2999-12-31 00:00:00' ;


