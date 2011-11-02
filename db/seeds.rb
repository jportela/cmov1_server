# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creates specialities
Speciality.create(sname: 'Accident and emergency medicine')
Speciality.create(sname: 'Allergology')
Speciality.create(sname: 'Anesthesiology')
Speciality.create(sname: 'Biological hematology')
Speciality.create(sname: 'Cardiology')
Speciality.create(sname: 'Child psychiatry')
Speciality.create(sname: 'Clinical biology')
Speciality.create(sname: 'Clinical chemistry')
Speciality.create(sname: 'Clinical neurophysiology')
Speciality.create(sname: 'Clinical radiology')
Speciality.create(sname: 'Dental, oral and maxillo-facial surgery')
Speciality.create(sname: 'Dermato-venerology')
Speciality.create(sname: 'Dermatology')
Speciality.create(sname: 'Endocrinology')
Speciality.create(sname: 'Gastro-enterologic surgery')
Speciality.create(sname: 'Gastroenterology')
Speciality.create(sname: 'General hematology')
Speciality.create(sname: 'General surgery')
Speciality.create(sname: 'Geriatrics')
Speciality.create(sname: 'Immunology')
Speciality.create(sname: 'Infectious diseases')
Speciality.create(sname: 'Internal medicine')
Speciality.create(sname: 'Laboratory medicine')
Speciality.create(sname: 'Maxillo-facial surgery')
Speciality.create(sname: 'Microbiology')
Speciality.create(sname: 'Nephrology')
Speciality.create(sname: 'Neuro-psychiatry')
Speciality.create(sname: 'Neurology')
Speciality.create(sname: 'Neurosurgery')
Speciality.create(sname: 'Nuclear medicine')
Speciality.create(sname: 'Obsetrics and gynecology')
Speciality.create(sname: 'Occupational medicine')
Speciality.create(sname: 'Ophthalmology')
Speciality.create(sname: 'Orthopaedics')
Speciality.create(sname: 'Otorhinolaryngology')
Speciality.create(sname: 'Pathology')
Speciality.create(sname: 'Pediatric surgery')
Speciality.create(sname: 'Pediatrics')
Speciality.create(sname: 'Pharmacology')
Speciality.create(sname: 'Physical medicine and rehabilitation')
Speciality.create(sname: 'Plastic surgery')
Speciality.create(sname: 'Psychiatry')
Speciality.create(sname: 'Public health')
Speciality.create(sname: 'Radiology')
Speciality.create(sname: 'Radiotherapy')
Speciality.create(sname: 'Respiratory medicine')
Speciality.create(sname: 'Rheumatology')
Speciality.create(sname: 'Stomatology')
Speciality.create(sname: 'Thoracic surgery')
Speciality.create(sname: 'Tropical medicine')
Speciality.create(sname: 'Urology')
Speciality.create(sname: 'Vascular surgery')
Speciality.create(sname: 'Venerology')

# Creates 2 Patients
Patient.create(name: 'Rui Pinto', address: 'Rua de Casa, 111', birthdate: Date.civil(1981, 3, 13), sex: 'Male', username: 'pat1', password_md5: 'pat1')
Patient.create(name: 'Carla Faria', address: 'Rua de Casa, 222', birthdate: Date.civil(1973, 9, 21), sex: 'Female', username: 'pat2', password_md5: 'pat2')

# Creates 2 Doctors
Doctor.create(name: 'Alexandre Gomes', photo: 'Rua de Casa, 333', birthdate: Date.civil(1972, 5, 3), username: 'doc1', password_md5: 'doc1', speciality_id: 33)
Doctor.create(name: 'Eduardo Rocha', photo: 'Rua de Casa, 444', birthdate: Date.civil(1980, 1, 11), username: 'doc2', password_md5: 'doc2', speciality_id: 13)

# Creates 4 Schedule Plans

SchedulePlan.create(start_date: Date.civil(2011, 10, 30), doctor_id: 1)
SchedulePlan.create(start_date: Date.civil(2011, 11, 8), doctor_id: 1)
SchedulePlan.create(start_date: Date.civil(2011, 10, 30), doctor_id: 2)
SchedulePlan.create(start_date: Date.civil(2011, 12, 8), doctor_id: 1)

# Creates 9 Schedules

Schedule.create(start_date: DateTime.civil(2011,11,3,9,0,0), end_date: DateTime.civil(2011,11,3,12,30,0), schedule_plan_id: 1)
Schedule.create(start_date: DateTime.civil(2011,11,4,9,0,0), end_date: DateTime.civil(2011,11,4,12,30,0), schedule_plan_id: 1)
Schedule.create(start_date: DateTime.civil(2011,11,4,15,0,0), end_date: DateTime.civil(2011,11,4,17,00,0), schedule_plan_id: 1)
Schedule.create(start_date: DateTime.civil(2011,11,8,10,0,0), end_date: DateTime.civil(2011,11,8,13,00,0), schedule_plan_id: 2)
Schedule.create(start_date: DateTime.civil(2011,11,9,9,0,0), end_date: DateTime.civil(2011,11,9,12,30,0), schedule_plan_id: 2)
Schedule.create(start_date: DateTime.civil(2011,11,10,14,30,0), end_date: DateTime.civil(2011,11,10,18,30,0), schedule_plan_id: 2)
Schedule.create(start_date: DateTime.civil(2011,11,3,10,0,0), end_date: DateTime.civil(2011,11,3,12,30,0), schedule_plan_id: 3)
Schedule.create(start_date: DateTime.civil(2011,11,4,15,0,0), end_date: DateTime.civil(2011,11,4,17,30,0), schedule_plan_id: 3)
Schedule.create(start_date: DateTime.civil(2011,12,9,11,0,0), end_date: DateTime.civil(2011,12,9,17,30,0), schedule_plan_id: 4)

# Creates 5 Appointments

Appointment.create(patient_id: 1, doctor_id: 1, schedule_id: 2, date: DateTime.civil(2011,11,4,10,30,0))
Appointment.create(patient_id: 1, doctor_id: 1, schedule_id: 4, date: DateTime.civil(2011,11,8,11,00,0))
Appointment.create(patient_id: 1, doctor_id: 1, schedule_id: 4, date: DateTime.civil(2011,11,8,12,00,0))
Appointment.create(patient_id: 1, doctor_id: 1, schedule_id: 9, date: DateTime.civil(2011,12,9,16,30,0))
Appointment.create(patient_id: 2, doctor_id: 1, schedule_id: 3, date: DateTime.civil(2011,11,4,16,00,0))
Appointment.create(patient_id: 2, doctor_id: 2, schedule_id: 4, date: DateTime.civil(2011,11,4,15,30,0))
