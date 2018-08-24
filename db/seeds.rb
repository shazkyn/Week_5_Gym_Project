require_relative( "../models/booking.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/activity.rb" )
require("pry-byebug")

Booking.delete_all()
Member.delete_all()
Activity.delete_all()


member1 = Member.new({
  "name" => "Jim Morrison",
  "age" => "27",
  "email" => "MrMojoRising@morrisonhotel.com",
  "phone" => "909 555 1234"
})
member1.save()

member2 = Member.new({
  "name" => "Carlos Santana",
  "age" => "41",
  "email" => "CarlosS@havanamoon.com",
  "phone" => "456 123 9999"
})
member2.save()

member3 = Member.new({
  "name" => "Janis Joplin",
  "age" => "27",
  "email" => "JanJop@.theblues.com",
  "phone" => "666 549 4859"
})
member3.save()

member4 = Member.new({
  "name" => "Dan McCafferty",
  "age" => "45",
  "email" => "DMac@razamanaz.co.uk",
  "phone" => "01356 234 7765"
})
member4.save()


activity1 = Activity.new({
  "activity_name" => "Spin",
  "capacity" => 10
})
activity1.save()

activity2 = Activity.new({
  "activity_name" => "yoga",
  "capacity" => 12
})
activity2.save()

activity3 = Activity.new({
  "activity_name" => "zumba",
  "capacity" => 15
})
activity3.save()

# booking a member into an activity
booking1 = Booking.new({
  "member_id" => member1.id,
  "activity_id" => activity2.id
  })
booking1.save()

binding.pry
nil
