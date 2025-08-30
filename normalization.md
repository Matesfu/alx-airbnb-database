# 3-NF
on the Booking table there is an attribute "total_price", which doesn't fullfill 3-NF, it is derived attribute.  
booking.total_price = (booking.end_date - booking.start_date) * property.pricePerNight  
so, if we eliminate the "total_price" from the booking table, we can make sure there is no redundancy. we can also calculate if it is needed.

![the Normalized ER diagram is:](../images/ER_Diagram_normalized.png)

