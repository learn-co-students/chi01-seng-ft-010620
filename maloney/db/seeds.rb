Malone.destroy_all

20.times do |malone_index|
  # times starts counting at 0. image names start at 1.
  malone_num = malone_index + 1
  Malone.create!(
    title: "The #{Faker::Verb.ing_form.capitalize} Malone.",
    image_url: "malone-#{malone_num}.jpg",
    description: "A photograph of recording artist Post Malone."
  )
end

Malone.last.update(description: "A photograph of recording artist Rita Ora in costume as recording artist Post Malone.")
