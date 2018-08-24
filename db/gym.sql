DROP TABLE bookings;
DROP TABLE members;
DROP TABLE activities;

CREATE TABLE activities
(
  id SERIAL8 primary key,
  activity_name VARCHAR(255) not null,
  capacity INT2
);

CREATE TABLE members
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  age INT2,
  email VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  member_id INT8 references members(id) ON DELETE CASCADE,
  activity_id INT8 references activities(id) ON DELETE CASCADE
);
