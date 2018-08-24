# The Grand Plan - Gym Project

## Tables

### Members

* id (PK)
* name
* age
* email_address
* phone_number

### Activities

* id (PK)
* activity name
* capacity

### Bookings

* id (PK)
* member_id
* activity_id

## Controllers

### Members

get /members
* list of members, name link to view member details (`get /members/:id`)
* button to create new member (`get /members/new`)

get /members/new
* form for creating member
* save button (`post /members`)
* cancel button (`get /members`)

post /members
* save member details
* redirect (`get /members/:id` for new id)

get /members/:id
* view member details
* edit button (`get /members/:id/edit`)
* delete button (`post /members/:id/delete`)

get /members/:id/edit
* edit member form (filled in)
* save button (`post /members/:id`)
* cancel button (`get /members/:id`)

post /members/:id/delete
* deletes the member (cascade the bookings)
* redirect (`/members`)

post /members/:id
* save member details
* redirect (`/members/:id`)

### Activities

get /activities
* list of activities
* name link to view activity details (`get /activities/:id`)
* button to create new activity (`get /activities/new`)

get /activites/new
* form for creating activity
* save button (`post /activities`)
* cancel button (`get /activities`)

post /activites
* save activity
* redirect (`/activities/:id` for new id)

get /activities/:id
* view activity details
* list of members booked
* edit button (`get /activities/:id/edit`)
* delete button (`post /activities/:id/delete`)
* each member has a cancel button (`post /bookings/:id/cancel`)
* book member button (`get /activities/:id/newbooking`)

get /activities/:id/edit
* form for editing activity (filled in)
* save button (`post /activities/:id`)
* cancel button (`get /activities/:id`)

get /activities/:id/newbooking
* form for adding a booking for a user to the activity
* shows activity name
* dropdown for the users that have not booked yet
* save button (`post /bookings`)
* cancel button (`get /activities/:id`)

post /activities/:id/delete
* deletes the activity
* (cascades to bookings)
* redirect (`/activities`)

### Bookings

post /bookings
* save the booking
* redirect (`/activities/:id`)

post /bookings/:id/cancel
* deletes the booking
* redirect (`/activities/:id` - get the activity_id from the booking)
