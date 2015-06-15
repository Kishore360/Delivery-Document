select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_lov l on l.row_id=COALESCE( CONCAT('STATE','~','TIME_CARD','~','~','~',UPPER(f.state )),'UNSPECIFIED')
and fi.state_src_key <> l.row_key and fi.row_key < 10000;



select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_lov l on l.row_id=COALESCE( CONCAT('CATEGORY','~','TIME_CARD','~','~','~',upper(a.category )),'UNSPECIFIED')
and fi.category_src_key <> l.row_key and fi.row_key < 10000;



select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_lov l on l.row_id=COALESCE( CONCAT('CHARGE_TYPE','~','TIME_CARD','~','~','~',upper(f.u_charge_type )),'UNSPECIFIED')
and fi.charge_type_key <> l.row_key and fi.row_key < 10000;

COALESCE(a.task,'UNSPECIFIED')

select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_task_c task on task.row_id=COALESCE(f.task,'UNSPECIFIED')
and fi.task_key <> task.row_key and fi.row_key < 10000;


select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_project project  on project.row_id=COALESCE(f.u_project,'UNSPECIFIED')
and fi.project_key <> project.row_key and fi.row_key < 10000;


select count(*) as cnt FROM rei_mdwdb.f_time_entry fi join rei_mdsdb.time_card_final a on (substring(fi.row_id,1,32) =a.sys_id) 
JOIN d_calendar_date b ON (a.week_starts_on >= b.week_start_date and a.week_starts_on <= b.week_end_date 
AND a.sourceinstance=b.source_id) and fi.date_key<>b.row_key and fi.row_key <100;

