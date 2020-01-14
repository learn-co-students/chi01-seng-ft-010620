class Doctor
  attr_reader :name, :specialty

  def initialize(name, specialty)
    @name = name
    @specialty = specialty
  end

end

class Patient
  attr_reader :name, :allergies

  def initialize(name, allergies = "n/a")
    @name = name
    @allergies = allergies
  end
end

class Appointment
  attr_reader :patient, :doctor
  @@all = []

  def self.all
    @@all
  end

  def initialize(patient, doctor)
    @patient = patient
    @doctor = doctor
    @@all << self
  end
end

pat = Patient.new("Pat", "shellfish")
grick = Patient.new("Grick")

house = Doctor.new("House MD", "avoidance")
quinn = Doctor.new("Dr. Quinn", "dysentery")

Appointment.new(pat, house)
Appointment.new(grick, house)
Appointment.new(grick, quinn)

pat.doctors
