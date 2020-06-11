update #DWH_TABLE_SCHEMA.d_project
set project_name=replace(project_name ,' – ',' - ')
where project_name like 'SFA%ERP Integration';

