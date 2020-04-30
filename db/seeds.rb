# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# --- Seed database ---
Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Specialty.destroy_all
DoctorSpecialty.destroy_all
Appointment.destroy_all

3.times do |index|
  city = City.create(name: "city_#{index}")
  specialty = Specialty.create(name: "specialty_#{index}")
  doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city,
                        specialties: [specialty], zip_code: Faker::Number.number(digits: 5).to_s)
  2.times do |index|
    patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city)
    Appointment.create(date: Time.now + 86400 * index , doctor: doctor, patient: patient, city: city)
    2.times do |index|  
      specialty = Specialty.create(name: "specialty_#{index}")
      doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city,
                            specialties: [specialty], zip_code: Faker::Number.number(digits: 5).to_s)
      Appointment.create(date: Time.now + 86400 * index , doctor: doctor, patient: patient, city: city)
    end
  end
end
    
tp Appointment.all