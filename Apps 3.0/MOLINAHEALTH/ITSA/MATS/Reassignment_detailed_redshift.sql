select'f_incident_activity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11 
union
select'd_incident_opened_by_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11 
                join        ldb.d_incident_opened_by_c     a112
                  on         (a11.opened_by_c_key = a112.row_key)