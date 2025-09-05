# Implement Indexes for Optimization
let's list out high-usage columns from User, Booking, and Property tables
* Users: email → used in login/authentication queries
* Properties: host_id → used in joins, location → often used in searches
* Bookings: user_id → for checking user’s bookings, property_id → for finding all bookings of a property, start_date, end_date → used for availability search.

  # Measure Query Performance
  measure query efficiency before and after indexes using EXPLAIN
  * Without index → Full table scan, which is slow.
  * With index → Uses index only scans relevant rows.
