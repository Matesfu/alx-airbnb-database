# Optimization Report after
Query on the [performance.sql](performance.sql) is used to retrieves all bookings along with the user details, property details, and payment details.  
Then tried to analyze the query's performace by using "EXPLAIN" key word:
![here you can see the result:](query_performance.png)
## Analysing the query's performance
### Observations:
#### Bookings (b)
Access type = ALL → full table scan.  
Inefficient for large datasets.  
No index used despite possible keys (idx_booking_property, idx_bookings_user).  
### Users (u)
Access type = eq_ref → best case. Using primary key on user_id. ✅
### Payments (pay)
Access type = ALL → full table scan.  
Notice "Using join buffer (BNL join)" → MySQL had to load rows into memory because no efficient index exists on booking_id.  
### Properties (p)
Access type = eq_ref → efficient, using primary key. ✅
## ⚠️ Inefficiencies:
Full table scan on Bookings.
Full table scan on Payments.
BNL (Block Nested Loop) join on Payments makes it worse for large data.
## Optimization
* Refactor the query for better performance. (you can get the refactored query on [performance.sql](performance.sql) )
* Add proper indexes like Payments lookup by booking_id
* 

