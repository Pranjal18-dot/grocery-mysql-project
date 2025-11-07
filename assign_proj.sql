-- Assignment-1: 30 Real-World Databases 

-- PART A: 30 DATABASES


-- 1) Airline Database
CREATE DATABASE IF NOT EXISTS airline_db; USE airline_db;
CREATE TABLE airlines (
  airline_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  iata_code VARCHAR(10),
  country VARCHAR(50),
  founded_year INT
) ENGINE=InnoDB;
CREATE TABLE airports (
  airport_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(50),
  country VARCHAR(50),
  iata_code VARCHAR(10)
) ENGINE=InnoDB;
CREATE TABLE aircrafts (
  aircraft_id INT AUTO_INCREMENT PRIMARY KEY,
  model VARCHAR(50),
  registration VARCHAR(20),
  capacity INT,
  manufacture_year INT
) ENGINE=InnoDB;
CREATE TABLE flights (
  flight_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_no VARCHAR(20),
  airline_id INT,
  origin_airport INT,
  dest_airport INT,
  departure DATETIME,
  arrival DATETIME,
  FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
) ENGINE=InnoDB;
CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  flight_id INT,
  passenger_name VARCHAR(100),
  seat_no VARCHAR(10),
  fare DECIMAL(10,2),
  booking_date DATE,
  FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
) ENGINE=InnoDB;

-- 2) Hospital Database
CREATE DATABASE IF NOT EXISTS hospital_db; USE hospital_db;
CREATE TABLE patients (
  patient_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  dob DATE,
  gender VARCHAR(10),
  contact VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE doctors (
  doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  specialization VARCHAR(50),
  experience_years INT,
  contact VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE appointments (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  appt_date DATE,
  appt_time TIME,
  status VARCHAR(20),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
) ENGINE=InnoDB;
CREATE TABLE bills (
  bill_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id INT,
  amount DECIMAL(10,2),
  payment_status VARCHAR(20),
  bill_date DATE,
  FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
) ENGINE=InnoDB;
CREATE TABLE medications (
  med_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  med_name VARCHAR(100),
  dosage VARCHAR(50),
  duration_days INT,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
) ENGINE=InnoDB;

-- 3) College Database
CREATE DATABASE IF NOT EXISTS college_db; USE college_db;
CREATE TABLE students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  dob DATE,
  email VARCHAR(100),
  major VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE faculties (
  faculty_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  department VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(20),
  title VARCHAR(100),
  credits INT,
  department VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE enrollments (
  enroll_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  course_id INT,
  semester VARCHAR(20),
  grade VARCHAR(5),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
) ENGINE=InnoDB;
CREATE TABLE classrooms (
  classroom_id INT AUTO_INCREMENT PRIMARY KEY,
  building VARCHAR(50),
  room_no VARCHAR(20),
  capacity INT,
  resources TEXT
) ENGINE=InnoDB;

-- 4) E-Commerce Database
CREATE DATABASE IF NOT EXISTS ecommerce_db; USE ecommerce_db;
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20),
  created_at DATETIME
) ENGINE=InnoDB;
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  sku VARCHAR(50),
  price DECIMAL(10,2),
  stock INT
) ENGINE=InnoDB;
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATETIME,
  total DECIMAL(10,2),
  status VARCHAR(30),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB;
CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;
-- renamed from 'returns' to 'product_returns' to avoid keyword conflict
CREATE TABLE product_returns (
  return_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  reason VARCHAR(255),
  return_date DATE,
  status VARCHAR(50),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

-- 5) Banking Database
CREATE DATABASE IF NOT EXISTS banking_db; USE banking_db;
CREATE TABLE accounts (
  account_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(100),
  account_type VARCHAR(20),
  balance DECIMAL(15,2),
  opened_date DATE
) ENGINE=InnoDB;
CREATE TABLE transactions (
  txn_id INT AUTO_INCREMENT PRIMARY KEY,
  account_id INT,
  amount DECIMAL(15,2),
  txn_type VARCHAR(20),
  txn_date DATETIME,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id)
) ENGINE=InnoDB;
CREATE TABLE customers_bank (
  cust_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  dob DATE,
  address TEXT,
  phone VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE loans (
  loan_id INT AUTO_INCREMENT PRIMARY KEY,
  account_id INT,
  loan_amount DECIMAL(15,2),
  interest_rate DECIMAL(5,2),
  start_date DATE,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id)
) ENGINE=InnoDB;
CREATE TABLE branches (
  branch_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  address TEXT,
  manager VARCHAR(100),
  phone VARCHAR(20)
) ENGINE=InnoDB;

-- 6) Library Database
CREATE DATABASE IF NOT EXISTS library_db; USE library_db;
CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  author VARCHAR(100),
  isbn VARCHAR(30),
  published_year INT,
  copies INT
) ENGINE=InnoDB;
CREATE TABLE members (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  join_date DATE,
  email VARCHAR(100),
  phone VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE loans (
  loan_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  member_id INT,
  loan_date DATE,
  due_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (member_id) REFERENCES members(member_id)
) ENGINE=InnoDB;
CREATE TABLE staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  role VARCHAR(50),
  hire_date DATE,
  contact VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  parent_category INT NULL
) ENGINE=InnoDB;

-- 7) Social Media Database
CREATE DATABASE IF NOT EXISTS social_db; USE social_db;
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50),
  fullname VARCHAR(100),
  email VARCHAR(100),
  created_at DATETIME
) ENGINE=InnoDB;
CREATE TABLE posts (
  post_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  content TEXT,
  created_at DATETIME,
  likes INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB;
CREATE TABLE comments (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  post_id INT,
  user_id INT,
  comment TEXT,
  created_at DATETIME,
  FOREIGN KEY (post_id) REFERENCES posts(post_id)
) ENGINE=InnoDB;
CREATE TABLE followers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  follower_id INT,
  follow_date DATETIME
) ENGINE=InnoDB;
CREATE TABLE messages (
  message_id INT AUTO_INCREMENT PRIMARY KEY,
  sender_id INT,
  receiver_id INT,
  message TEXT,
  sent_at DATETIME
) ENGINE=InnoDB;

-- 8) E-Learning Platform Database
CREATE DATABASE IF NOT EXISTS elearning_db; USE elearning_db;
CREATE TABLE learners (
  learner_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  registered_date DATE,
  country VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE instructors (
  instructor_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  bio TEXT,
  email VARCHAR(100),
  joined_date DATE
) ENGINE=InnoDB;
CREATE TABLE courses_el (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  description TEXT,
  price DECIMAL(10,2),
  created_date DATE
) ENGINE=InnoDB;
CREATE TABLE enrollments_el (
  enroll_id INT AUTO_INCREMENT PRIMARY KEY,
  learner_id INT,
  course_id INT,
  enroll_date DATE,
  progress DECIMAL(5,2),
  FOREIGN KEY (learner_id) REFERENCES learners(learner_id)
) ENGINE=InnoDB;
CREATE TABLE lessons (
  lesson_id INT AUTO_INCREMENT PRIMARY KEY,
  course_id INT,
  title VARCHAR(200),
  content TEXT,
  duration_minutes INT,
  FOREIGN KEY (course_id) REFERENCES courses_el(course_id)
) ENGINE=InnoDB;

-- 9) Hotel Management Database
CREATE DATABASE IF NOT EXISTS hotel_db; USE hotel_db;
CREATE TABLE guests (
  guest_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20),
  country VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE rooms (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  room_no VARCHAR(10),
  type VARCHAR(50),
  price DECIMAL(10,2),
  status VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE reservations (
  res_id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT,
  room_id INT,
  checkin DATE,
  checkout DATE,
  status VARCHAR(20),
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
) ENGINE=InnoDB;
CREATE TABLE services (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  description TEXT
) ENGINE=InnoDB;
CREATE TABLE invoices (
  invoice_id INT AUTO_INCREMENT PRIMARY KEY,
  reservation_id INT,
  amount DECIMAL(10,2),
  invoice_date DATE,
  paid BOOLEAN,
  FOREIGN KEY (reservation_id) REFERENCES reservations(res_id)
) ENGINE=InnoDB;

-- 10) Retail Store Database
CREATE DATABASE IF NOT EXISTS retail_db; USE retail_db;
CREATE TABLE suppliers (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  contact VARCHAR(100),
  address TEXT,
  rating INT
) ENGINE=InnoDB;
CREATE TABLE items (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  sku VARCHAR(50),
  price DECIMAL(10,2),
  stock INT
) ENGINE=InnoDB;
CREATE TABLE purchases (
  purchase_id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_id INT,
  purchase_date DATE,
  total_amount DECIMAL(12,2),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
) ENGINE=InnoDB;
CREATE TABLE sales (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT,
  quantity INT,
  sale_date DATE,
  total_price DECIMAL(12,2),
  FOREIGN KEY (item_id) REFERENCES items(item_id)
) ENGINE=InnoDB;
CREATE TABLE customers_retail (
  cust_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20),
  loyalty_points INT
) ENGINE=InnoDB;

-- 11) Logistics Database
CREATE DATABASE IF NOT EXISTS logistics_db; USE logistics_db;
CREATE TABLE vehicles (
  vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
  plate_no VARCHAR(20),
  model VARCHAR(50),
  capacity INT,
  status VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE drivers (
  driver_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  license_no VARCHAR(50),
  phone VARCHAR(20),
  hire_date DATE
) ENGINE=InnoDB;
CREATE TABLE shipments (
  shipment_id INT AUTO_INCREMENT PRIMARY KEY,
  origin VARCHAR(100),
  destination VARCHAR(100),
  departure_date DATE,
  arrival_date DATE
) ENGINE=InnoDB;
CREATE TABLE tracking (
  track_id INT AUTO_INCREMENT PRIMARY KEY,
  shipment_id INT,
  location VARCHAR(200),
  status VARCHAR(50),
  updated_at DATETIME,
  FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id)
) ENGINE=InnoDB;
CREATE TABLE warehouses (
  warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  address TEXT,
  capacity INT,
  manager VARCHAR(100)
) ENGINE=InnoDB;

-- 12) Insurance Database
CREATE DATABASE IF NOT EXISTS insurance_db; USE insurance_db;
CREATE TABLE policyholders (
  holder_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  dob DATE,
  email VARCHAR(100),
  phone VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE policies (
  policy_id INT AUTO_INCREMENT PRIMARY KEY,
  holder_id INT,
  policy_type VARCHAR(50),
  start_date DATE,
  end_date DATE,
  premium DECIMAL(12,2),
  FOREIGN KEY (holder_id) REFERENCES policyholders(holder_id)
) ENGINE=InnoDB;
CREATE TABLE claims (
  claim_id INT AUTO_INCREMENT PRIMARY KEY,
  policy_id INT,
  claim_date DATE,
  amount DECIMAL(12,2),
  status VARCHAR(50),
  FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
) ENGINE=InnoDB;
CREATE TABLE agents (
  agent_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  region VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE payments_ins (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  policy_id INT,
  amount DECIMAL(12,2),
  payment_date DATE,
  method VARCHAR(50)
) ENGINE=InnoDB;

-- 13) Human Resources Database
CREATE DATABASE IF NOT EXISTS hr_db; USE hr_db;
CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  position VARCHAR(50),
  department VARCHAR(50),
  hire_date DATE
) ENGINE=InnoDB;
CREATE TABLE salaries (
  salary_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  amount DECIMAL(12,2),
  effective_from DATE,
  effective_to DATE,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
) ENGINE=InnoDB;
CREATE TABLE attendance (
  att_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  att_date DATE,
  in_time TIME,
  out_time TIME,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
) ENGINE=InnoDB;
CREATE TABLE leaves (
  leave_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  leave_type VARCHAR(50),
  start_date DATE,
  end_date DATE,
  status VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE performance (
  perf_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  review_date DATE,
  rating INT,
  comments TEXT
) ENGINE=InnoDB;

-- 14) Manufacturing Database
CREATE DATABASE IF NOT EXISTS manufacturing_db; USE manufacturing_db;
CREATE TABLE products_man (
  prod_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  sku VARCHAR(50),
  description TEXT,
  unit_cost DECIMAL(10,2)
) ENGINE=InnoDB;
CREATE TABLE bills_materials (
  bm_id INT AUTO_INCREMENT PRIMARY KEY,
  prod_id INT,
  material VARCHAR(100),
  qty_required DECIMAL(10,2),
  unit VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE machines (
  machine_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  purchase_date DATE,
  status VARCHAR(50),
  last_maintenance DATE
) ENGINE=InnoDB;
CREATE TABLE production_orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  prod_id INT,
  quantity INT,
  start_date DATE,
  end_date DATE
) ENGINE=InnoDB;
CREATE TABLE quality_checks (
  qc_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  check_date DATE,
  result VARCHAR(50),
  remarks TEXT
) ENGINE=InnoDB;

-- 15) Real Estate Database
CREATE DATABASE IF NOT EXISTS realestate_db; USE realestate_db;
CREATE TABLE properties (
  prop_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  address TEXT,
  prop_type VARCHAR(50),
  price DECIMAL(15,2)
) ENGINE=InnoDB;
CREATE TABLE agents_re (
  agent_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(100),
  agency VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE listings (
  listing_id INT AUTO_INCREMENT PRIMARY KEY,
  prop_id INT,
  agent_id INT,
  listed_date DATE,
  status VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE clients_re (
  client_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  contact VARCHAR(100),
  interested_in VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE visits (
  visit_id INT AUTO_INCREMENT PRIMARY KEY,
  listing_id INT,
  client_id INT,
  visit_date DATE,
  feedback TEXT
) ENGINE=InnoDB;

-- 16) Food Delivery Database
CREATE DATABASE IF NOT EXISTS food_db; USE food_db;
CREATE TABLE restaurants (
  rest_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  address TEXT,
  cuisine VARCHAR(50),
  phone VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE menu_items (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  rest_id INT,
  name VARCHAR(150),
  price DECIMAL(10,2),
  veg BOOLEAN,
  FOREIGN KEY (rest_id) REFERENCES restaurants(rest_id)
) ENGINE=InnoDB;
CREATE TABLE orders_food (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(100),
  rest_id INT,
  total DECIMAL(10,2),
  order_time DATETIME
) ENGINE=InnoDB;
CREATE TABLE delivery_partners (
  partner_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  phone VARCHAR(20),
  vehicle VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE order_status (
  status_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  status VARCHAR(50),
  updated_at DATETIME
) ENGINE=InnoDB;

-- 17) Entertainment / Movie Database
CREATE DATABASE IF NOT EXISTS movie_db; USE movie_db;
CREATE TABLE movies (
  movie_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  director VARCHAR(100),
  release_date DATE,
  genre VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE actors (
  actor_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  dob DATE,
  nationality VARCHAR(50),
  awards INT
) ENGINE=InnoDB;
CREATE TABLE castings (
  casting_id INT AUTO_INCREMENT PRIMARY KEY,
  movie_id INT,
  actor_id INT,
  role VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE screenings (
  screen_id INT AUTO_INCREMENT PRIMARY KEY,
  movie_id INT,
  theater VARCHAR(100),
  show_time DATETIME,
  seats_available INT
) ENGINE=InnoDB;
CREATE TABLE reviews (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  movie_id INT,
  user_name VARCHAR(100),
  rating INT,
  comment TEXT
) ENGINE=InnoDB;

-- 18) Sports Management Database
CREATE DATABASE IF NOT EXISTS sports_db; USE sports_db;
CREATE TABLE teams (
  team_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  coach VARCHAR(100),
  founded INT,
  city VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE players (
  player_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  team_id INT,
  position VARCHAR(50),
  jersey_no INT,
  FOREIGN KEY (team_id) REFERENCES teams(team_id)
) ENGINE=InnoDB;
CREATE TABLE matches (
  match_id INT AUTO_INCREMENT PRIMARY KEY,
  home_team INT,
  away_team INT,
  match_date DATE,
  venue VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE statistics (
  stat_id INT AUTO_INCREMENT PRIMARY KEY,
  player_id INT,
  match_id INT,
  goals INT,
  assists INT,
  minutes_played INT
) ENGINE=InnoDB;
CREATE TABLE tickets (
  ticket_id INT AUTO_INCREMENT PRIMARY KEY,
  match_id INT,
  seat_no VARCHAR(20),
  price DECIMAL(10,2),
  sold BOOLEAN
) ENGINE=InnoDB;

-- 19) Telecommunications Database
CREATE DATABASE IF NOT EXISTS telecom_db; USE telecom_db;
CREATE TABLE subscribers (
  sub_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  phone VARCHAR(20),
  plan VARCHAR(50),
  activated_date DATE
) ENGINE=InnoDB;
CREATE TABLE plans (
  plan_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  data_gb DECIMAL(5,2),
  price DECIMAL(10,2),
  validity_days INT
) ENGINE=InnoDB;
-- renamed from 'usage' to 'usage_logs' to avoid keyword conflict
CREATE TABLE usage_logs (
  usage_id INT AUTO_INCREMENT PRIMARY KEY,
  sub_id INT,
  date DATE,
  minutes INT,
  data_mb DECIMAL(10,2)
) ENGINE=InnoDB;
CREATE TABLE invoices_tel (
  inv_id INT AUTO_INCREMENT PRIMARY KEY,
  sub_id INT,
  amount DECIMAL(12,2),
  due_date DATE,
  paid BOOLEAN
) ENGINE=InnoDB;
CREATE TABLE towers (
  tower_id INT AUTO_INCREMENT PRIMARY KEY,
  location VARCHAR(200),
  height_m DECIMAL(6,2),
  operator VARCHAR(100)
) ENGINE=InnoDB;

-- 20) Education / School Database
CREATE DATABASE IF NOT EXISTS school_db; USE school_db;
CREATE TABLE pupils (
  pupil_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  dob DATE,
  class VARCHAR(20),
  guardian_contact VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE teachers (
  teacher_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  subject VARCHAR(50),
  email VARCHAR(100),
  hire_date DATE
) ENGINE=InnoDB;
CREATE TABLE timetables (
  tt_id INT AUTO_INCREMENT PRIMARY KEY,
  class VARCHAR(20),
  day VARCHAR(20),
  period INT,
  subject VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE exams (
  exam_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  start_date DATE,
  end_date DATE,
  max_marks INT
) ENGINE=InnoDB;
CREATE TABLE results (
  result_id INT AUTO_INCREMENT PRIMARY KEY,
  pupil_id INT,
  exam_id INT,
  marks_obtained INT,
  grade VARCHAR(5)
) ENGINE=InnoDB;

-- 21) Automotive Service Database
CREATE DATABASE IF NOT EXISTS autoservice_db; USE autoservice_db;
CREATE TABLE customers_auto (
  cust_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  phone VARCHAR(20),
  vehicle_model VARCHAR(100),
  reg_no VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE service_records (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  cust_id INT,
  service_date DATE,
  details TEXT,
  cost DECIMAL(10,2)
) ENGINE=InnoDB;
CREATE TABLE mechanics (
  mech_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  specialty VARCHAR(100),
  experience INT,
  phone VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE spare_parts (
  part_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  sku VARCHAR(50),
  price DECIMAL(10,2),
  stock INT
) ENGINE=InnoDB;
CREATE TABLE appointments_auto (
  appt_id INT AUTO_INCREMENT PRIMARY KEY,
  cust_id INT,
  mech_id INT,
  appt_date DATE,
  status VARCHAR(20)
) ENGINE=InnoDB;

-- 22) Pharmacy Database
CREATE DATABASE IF NOT EXISTS pharmacy_db; USE pharmacy_db;
CREATE TABLE medicines (
  med_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  brand VARCHAR(100),
  batch_no VARCHAR(50),
  expiry DATE,
  price DECIMAL(10,2)
) ENGINE=InnoDB;
CREATE TABLE suppliers_ph (
  sup_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  contact VARCHAR(100),
  license_no VARCHAR(50),
  address TEXT
) ENGINE=InnoDB;
CREATE TABLE purchases_ph (
  purchase_id INT AUTO_INCREMENT PRIMARY KEY,
  med_id INT,
  sup_id INT,
  qty INT,
  purchase_date DATE
) ENGINE=InnoDB;
CREATE TABLE sales_ph (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  med_id INT,
  qty INT,
  sale_date DATE,
  total_price DECIMAL(12,2)
) ENGINE=InnoDB;
CREATE TABLE prescriptions (
  presc_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_name VARCHAR(100),
  doctor_name VARCHAR(100),
  med_details TEXT,
  date_issued DATE
) ENGINE=InnoDB;

-- 23) Event Management Database
CREATE DATABASE IF NOT EXISTS events_db; USE events_db;
CREATE TABLE events (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  venue VARCHAR(200),
  start_date DATE,
  end_date DATE
) ENGINE=InnoDB;
CREATE TABLE attendees (
  att_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  ticket_type VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE vendors (
  vendor_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  service VARCHAR(100),
  contact VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE schedules (
  sched_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  activity VARCHAR(200),
  start_time DATETIME,
  end_time DATETIME
) ENGINE=InnoDB;
CREATE TABLE tickets_event (
  ticket_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  seat VARCHAR(20),
  price DECIMAL(10,2)
) ENGINE=InnoDB;

-- 24) Agriculture Database
CREATE DATABASE IF NOT EXISTS agriculture_db; USE agriculture_db;
CREATE TABLE farms (
  farm_id INT AUTO_INCREMENT PRIMARY KEY,
  owner_name VARCHAR(100),
  location VARCHAR(200),
  area_acres DECIMAL(8,2),
  crop_type VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE machinery_ag (
  mach_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  purchase_date DATE,
  status VARCHAR(50),
  last_service DATE
) ENGINE=InnoDB;
CREATE TABLE harvests (
  harvest_id INT AUTO_INCREMENT PRIMARY KEY,
  farm_id INT,
  crop VARCHAR(100),
  quantity DECIMAL(12,2),
  harvest_date DATE
) ENGINE=InnoDB;
CREATE TABLE suppliers_ag (
  sup_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  supplies VARCHAR(200),
  contact VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE soil_tests (
  test_id INT AUTO_INCREMENT PRIMARY KEY,
  farm_id INT,
  ph DECIMAL(4,2),
  nutrients TEXT,
  test_date DATE
) ENGINE=InnoDB;

-- 25) Energy / Utilities Database
CREATE DATABASE IF NOT EXISTS utilities_db; USE utilities_db;
CREATE TABLE customers_ut (
  cust_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  address TEXT,
  meter_no VARCHAR(50),
  connection_date DATE
) ENGINE=InnoDB;
CREATE TABLE meters (
  meter_id INT AUTO_INCREMENT PRIMARY KEY,
  meter_no VARCHAR(50),
  type VARCHAR(50),
  install_date DATE
) ENGINE=InnoDB;
CREATE TABLE readings (
  reading_id INT AUTO_INCREMENT PRIMARY KEY,
  meter_id INT,
  reading_date DATE,
  consumption_kwh DECIMAL(12,2)
) ENGINE=InnoDB;
CREATE TABLE bills_ut (
  bill_id INT AUTO_INCREMENT PRIMARY KEY,
  cust_id INT,
  period_start DATE,
  period_end DATE,
  amount DECIMAL(12,2)
) ENGINE=InnoDB;
CREATE TABLE outages (
  outage_id INT AUTO_INCREMENT PRIMARY KEY,
  area VARCHAR(200),
  start_time DATETIME,
  end_time DATETIME,
  reason TEXT
) ENGINE=InnoDB;

-- 26) Travel Agency Database
CREATE DATABASE IF NOT EXISTS travel_db; USE travel_db;
CREATE TABLE packages (
  pkg_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  description TEXT,
  price DECIMAL(12,2),
  duration_days INT
) ENGINE=InnoDB;
CREATE TABLE bookings_tr (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  pkg_id INT,
  customer_name VARCHAR(100),
  travel_date DATE,
  passengers INT
) ENGINE=InnoDB;
CREATE TABLE destinations (
  dest_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(50),
  description TEXT
) ENGINE=InnoDB;
CREATE TABLE guides (
  guide_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  language VARCHAR(100),
  phone VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE reviews_tr (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  pkg_id INT,
  rating INT,
  comment TEXT,
  reviewer VARCHAR(100)
) ENGINE=InnoDB;

-- 27) Music Streaming Database
CREATE DATABASE IF NOT EXISTS music_db; USE music_db;
CREATE TABLE artists (
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(50),
  genre VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE albums (
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_id INT,
  title VARCHAR(200),
  release_date DATE,
  label VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE tracks (
  track_id INT AUTO_INCREMENT PRIMARY KEY,
  album_id INT,
  title VARCHAR(200),
  length_seconds INT,
  play_count INT
) ENGINE=InnoDB;
CREATE TABLE users_music (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(100),
  signup_date DATE
) ENGINE=InnoDB;
CREATE TABLE playlists (
  playlist_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  name VARCHAR(100),
  created_at DATETIME
) ENGINE=InnoDB;

-- 28) Payroll Database
CREATE DATABASE IF NOT EXISTS payroll_db; USE payroll_db;
CREATE TABLE payroll_emps (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  emp_code VARCHAR(50),
  department VARCHAR(50),
  join_date DATE
) ENGINE=InnoDB;
CREATE TABLE payroll_salaries (
  payslip_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  month VARCHAR(20),
  gross DECIMAL(12,2),
  net DECIMAL(12,2)
) ENGINE=InnoDB;
CREATE TABLE payroll_taxes (
  tax_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  year INT,
  amount DECIMAL(12,2)
) ENGINE=InnoDB;
CREATE TABLE payroll_benefits (
  benefit_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  benefit_type VARCHAR(100),
  amount DECIMAL(12,2)
) ENGINE=InnoDB;
CREATE TABLE payroll_history (
  hist_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  change_date DATE,
  notes TEXT
) ENGINE=InnoDB;

-- 29) Charity / NGO Database
CREATE DATABASE IF NOT EXISTS ngo_db; USE ngo_db;
CREATE TABLE donors (
  donor_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20),
  city VARCHAR(50)
) ENGINE=InnoDB;
CREATE TABLE donations (
  don_id INT AUTO_INCREMENT PRIMARY KEY,
  donor_id INT,
  amount DECIMAL(12,2),
  donation_date DATE,
  purpose VARCHAR(200)
) ENGINE=InnoDB;
CREATE TABLE projects_ng (
  project_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  start_date DATE,
  end_date DATE,
  budget DECIMAL(15,2)
) ENGINE=InnoDB;
CREATE TABLE volunteers (
  vol_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  skills TEXT,
  joined_date DATE
) ENGINE=InnoDB;
CREATE TABLE expenses_ng (
  exp_id INT AUTO_INCREMENT PRIMARY KEY,
  project_id INT,
  amount DECIMAL(12,2),
  exp_date DATE,
  description TEXT
) ENGINE=InnoDB;

-- 30) Fashion / Apparel Database
CREATE DATABASE IF NOT EXISTS fashion_db; USE fashion_db;
CREATE TABLE designs (
  design_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  designer VARCHAR(100),
  season VARCHAR(50),
  price DECIMAL(10,2)
) ENGINE=InnoDB;
CREATE TABLE inventory_f (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  design_id INT,
  size VARCHAR(10),
  color VARCHAR(50),
  qty INT
) ENGINE=InnoDB;
CREATE TABLE stores_f (
  store_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(200),
  manager VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE sales_f (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  store_id INT,
  item_id INT,
  sale_date DATE,
  qty INT
) ENGINE=InnoDB;
CREATE TABLE suppliers_f (
  sup_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  contact VARCHAR(100),
  lead_time_days INT
) ENGINE=InnoDB;

-- PART B: In-Depth Focus Task (choose 1 database from above)
  

USE library_db;


DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  parent_category INT NULL
) ENGINE=InnoDB;

CREATE TABLE staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  role VARCHAR(50),
  hire_date DATE,
  contact VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  author VARCHAR(100),
  isbn VARCHAR(30),
  published_year INT,
  copies INT,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
) ENGINE=InnoDB;

CREATE TABLE members (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  join_date DATE,
  email VARCHAR(100),
  phone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE loans (
  loan_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  member_id INT,
  loan_date DATE,
  due_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (member_id) REFERENCES members(member_id)
) ENGINE=InnoDB;

-- Insert 10 categories
INSERT INTO categories (name, description, parent_category) VALUES
('Fiction','General fiction books', NULL),
('Non-Fiction','Informational books', NULL),
('Science','Science related books', 2),
('Technology','Tech & programming', 2),
('History','Historical books', 2),
('Children','Books for children', 1),
('Biographies','Life stories', 2),
('Mathematics','Math books', 3),
('Art','Art & design', 2),
('Self-Help','Personal improvement', 2);

-- Insert 10 staff
INSERT INTO staff (name, role, hire_date, contact) VALUES
('Asha Kulkarni','Librarian','2018-03-15','9876543210'),
('Rahul Mehta','Assistant Librarian','2020-07-01','9876501234'),
('Sneha Patil','Cataloguer','2019-05-20','9876512345'),
('Vikram Rao','IT Support','2021-01-10','9876523456'),
('Maya Singh','Junior Staff','2022-09-12','9876534567'),
('Rohit Sharma','Security','2017-11-23','9876549876'),
('Neha Joshi','Archivist','2016-04-03','9876598765'),
('Priya Nair','Acquisitions','2019-12-01','9876587654'),
('Karan Desai','Maintenance','2015-06-30','9876576543'),
('Leena Iyer','Volunteer','2023-02-14','9876565432');

-- Insert 10 books
INSERT INTO books (title, author, isbn, published_year, copies, category_id) VALUES
('Effective Java','Joshua Bloch','9780134685991',2018,5,4),
('Clean Code','Robert C. Martin','9780132350884',2008,4,4),
('The Selfish Gene','Richard Dawkins','9780192860927',1976,3,3),
('A Brief History of Time','Stephen Hawking','9780553380163',1988,2,3),
('The Diary of a Young Girl','Anne Frank','9780553296983',1947,3,7),
('Mathematical Principles','Isaac Newton','9780192835826',1687,1,8),
('The Art of War','Sun Tzu','9781590302255',500,2,9),
('The Alchemist','Paulo Coelho','9780061122415',1988,6,1),
('Think and Grow Rich','Napoleon Hill','9780449214923',1937,4,10),
('Children of Time','Adrian Tchaikovsky','9780356508849',2015,2,1);

-- Insert 10 members
INSERT INTO members (name, join_date, email, phone) VALUES
('Priyanka Sharma','2023-01-10','priyanka@example.com','9123456780'),
('Amit Verma','2022-06-20','amitv@example.com','9123456781'),
('Sunita Rao','2021-11-05','sunita@example.com','9123456782'),
('Dev Patel','2020-02-14','devp@example.com','9123456783'),
('Rita Singh','2019-08-30','rita@example.com','9123456784'),
('Kunal Gupta','2018-04-12','kunalg@example.com','9123456785'),
('Meera Namboodiri','2017-09-25','meera@example.com','9123456786'),
('Sahil Khan','2024-03-03','sahil@example.com','9123456787'),
('Tara Bose','2023-07-19','tara@example.com','9123456788'),
('Anil Kapoor','2022-12-01','anil@example.com','9123456789');

-- Insert 12 loans (some returned, some overdue)
INSERT INTO loans (book_id, member_id, loan_date, due_date, return_date) VALUES
(1,1,'2024-10-01','2024-10-15','2024-10-12'),
(2,2,'2024-10-05','2024-10-19',NULL),
(3,3,'2024-09-10','2024-09-24','2024-09-20'),
(4,4,'2024-11-01','2024-11-15',NULL),
(5,5,'2024-08-01','2024-08-15','2024-08-10'),
(6,6,'2024-07-15','2024-07-29','2024-07-29'),
(7,7,'2024-06-10','2024-06-24','2024-06-22'),
(8,8,'2024-10-20','2024-11-03',NULL),
(9,9,'2024-05-05','2024-05-19','2024-05-18'),
(10,10,'2024-04-12','2024-04-26','2024-04-25'),
(1,3,'2024-11-02','2024-11-16',NULL),
(2,4,'2024-11-03','2024-11-17',NULL);

-- Sample Queries for Part B

-- 1) Display all data from each table
SELECT * FROM categories;
SELECT * FROM staff;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM loans;

-- 2) Meaningful operations
-- c) UPDATE: mark a book copy count after acquisition
UPDATE books SET copies = copies + 2 WHERE title = 'Clean Code';

-- d) JOIN query: show current loans with member and book info (not yet returned)
SELECT l.loan_id, b.title, m.name AS member_name, l.loan_date, l.due_date
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;

-- e) AGGREGATE: number of books loaned per member
SELECT m.member_id, m.name, COUNT(l.loan_id) AS loans_count
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.name
ORDER BY loans_count DESC;

-- f) DELETE example: remove a volunteer staff (example)
DELETE FROM staff WHERE name = 'Leena Iyer';

-- h) ALTER example: add a new column to members for address
ALTER TABLE members ADD COLUMN address VARCHAR(255) NULL;

-- i) Transaction example
START TRANSACTION;
SELECT copies FROM books WHERE book_id = 1 FOR UPDATE;
UPDATE books SET copies = copies - 1 WHERE book_id = 1 AND copies > 0;
INSERT INTO loans (book_id, member_id, loan_date, due_date) VALUES (1, 2, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));
COMMIT;

-- j) Create an index to speed up lookups on loans
CREATE INDEX idx_loans_member ON loans(member_id);

