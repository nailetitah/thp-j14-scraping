class Deputy
   @no_of_deputy = 0
   def initialize(first_name, last_name, email)
      @deputy_firstname = first_name
      @deputy_lastname = last_name
      @deputy_email = email
   end
end

deputy1 = Deputy.new("Cédric", "Villani", "cedric@email.com")

deputys = [
  {"first_name" => "Cédric", "last_name" => "Villani"},
  {"first_name" => "François", "last_name" => "Baroin"}
]
first_name = ["Cédric", "François"]
last_name = ["Villani", "Baroin"]
email = ["cedric@email.com", "francois@email.com"]

first_name.map! { |fnames| ["first_name", fnames] }
last_name.map! { |lnames| ["last_name", lnames] }
email.map! { |em | ["email", em] }

h = first_name.zip(last_name, email)
h.map! { |el| Hash[el] }.to_a
# puts h.inspect

a = "Cédric Villani de La Bat".split
puts a[1..-1]
# Grouper en arrays multi
# Puis choper chaque élément du multi qu'on envoie dans un hash

