

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN CONCAT('compliance_flag not set correctly for  records in dwh_f_employee_termination ' )
ELSE 'SUCCESS' END AS Message
from #DWH_TABLE_SCHEMA.dwh_f_employee_termination et
join #DWH_TABLE_SCHEMA.dwh_d_request_item dri
on(SUBSTRING(et.row_id, LOCATE('~',et.row_id)+1, length(et.row_id)-LOCATE('~',et.row_id)+1) =dri.employee_number)
where case when DATE_FORMAT(opened_on,'%Y%m%d')  <= last_working_day_key then 'Y' else 'N' end <> compliance_flag 
