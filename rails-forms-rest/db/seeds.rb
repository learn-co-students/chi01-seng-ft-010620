# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Cohort.create(name: 'web-103019')
c2 = Cohort.create(name: 'web-112019')

s1 = Student.create(name: 'Rosa', cohort: c1)
s2 = Student.create(name: 'Lindsey', cohort: c1)
s3 = Student.create(name: 'Esmery', cohort: c1)
s4 = Student.create(name: 'Alex', cohort: c2)
s5 = Student.create(name: 'Johann', cohort: c2)
s6 = Student.create(name: 'Meryl', cohort: c2)
