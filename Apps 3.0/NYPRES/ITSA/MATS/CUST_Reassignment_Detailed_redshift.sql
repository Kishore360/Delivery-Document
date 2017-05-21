select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'd_location_parent_incident_c ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_opened_by_c b
on a11.current_opened_by_key=b.row_key
join ldb.d_location_opened_by_c d
on d.row_key=b.location_key
join ldb.d_location_parent_incident_c e
on e.row_key=d.parent_location_c_key