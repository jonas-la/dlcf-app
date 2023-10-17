# This file should contain all the record creation needed to seed the database.
# The data can then be loaded with the bin/rails db:seed command 
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
books = Book.create([
  { name: "LOTR" }, { name: "Fangorn Fanatics" }, { name: "Mirkwood Murders" }, 
  { name: "Shire Shenanigans" }, { name: "Gollums Greats" }
]
                   )

members_data = [
  { 
    first_name: 'Jonas', 
    preferred_name: 'Jonas', 
    last_name: 'Land', 
    email: "jonasaustinland@tamu.edu", 
    is_member: true, 
    is_admin: true,
    bio: 'Some bio text', 
    contact: 'Contact info', 
    photo_file_name: 'john.jpg', 
    role: 'Admin' 
  },
  { 
    first_name: 'Adam', 
    preferred_name: 'Adam', 
    last_name: 'Pinto', 
    email: "adampinto@tamu.edu", 
    is_member: true, 
    is_admin: true, 
    bio: 'Some bio text', 
    contact: 'Contact info', 
    photo_file_name: 'john.jpg', 
    role: 'Admin' 
  },
  { 
    first_name: 'Daniel', 
    preferred_name: 'Daniel', 
    last_name: 'McSween', 
    email: "daniel14676@tamu.edu", 
    is_member: true, 
    is_admin: true, 
    bio: 'Some bio text', 
    contact: 'Contact info', 
    photo_file_name: 'john.jpg', 
    role: 'Admin' 
  },
  { 
    first_name: 'Isabelle', 
    preferred_name: 'Isabelle', 
    last_name: 'Grimesay', 
    email: "isabelle.grimesey@tamu.edu", 
    is_member: true, 
    is_admin: true, 
    bio: 'Some bio text', 
    contact: 'Contact info', 
    photo_file_name: 'john.jpg', 
    role: 'Admin' 
  },
  { 
    first_name: 'Mark', 
    preferred_name: 'Mark', 
    last_name: 'Baca', 
    email: "markbaca42@tamu.edu",
    is_member: true, 
    is_admin: true, 
    bio: 'Some bio text', 
    contact: 'Contact info', 
    photo_file_name: 'john.jpg',
    role: 'Admin' 
  },
  { 
    first_name: 'Jonas', 
    preferred_name: 'Jonas', 
    last_name: 'Land', 
    email: "jonasaustinland@gmail.com",
    is_member: true, 
    is_admin: false, 
    bio: 'Some bio text', 
    contact: 'Contact info', 
    photo_file_name: 'john.jpg',
    role: 'Admin' 
  },
  { 
    first_name: 'Olukayode', 
    preferred_name: 'Olukayode', 
    last_name: 'Apata', 
    email: "apata.olukayode@tamu.edu",
    is_member: true, 
    is_admin: true, 
    bio: 'Some bio text', 
    contact: 'apata.olukayode@tamu.edu', 
    photo_file_name: 'john.jpg', 
    role: 'Admin' 
  },
  { 
    first_name: 'Test', 
    preferred_name: 'Test', 
    last_name: 'Officer', 
    email: "dclftest@gmail.com", 
    is_member: true, 
    is_admin: true, 
    bio: 'Some bio text', 
    contact: '', 
    photo_file_name: 'john.jpg',
    role: 'Admin' 
  },
  { 
    first_name: 'Test', 
    preferred_name: 'Test', 
    last_name: 'Member', 
    email: "dlcftest@gmail.com", 
    is_member: true, 
    is_admin: false, 
    bio: 'Some bio text', 
    contact: '', 
    photo_file_name: 'john.jpg', 
    role: 'Admin' 
  },
  
  

  
  # Add more member data here as needed
]

# Create members from the data
members_data.each do |data|
  Member.create(data)
end



org_info_data = [
  { 
    title: 'About Us', 
    description: "The DLCF has a divine mandate and mission to impact," \
                 "build, and engage interested students and employees of Texas A&M" \
                 "University to be their best for Jesus Christ." 
  }
  # Add more member data here as needed
]

# Create members from the data
org_info_data.each do |data|
  Orginfo.create(data)
end

# seed database with default image and charter
org_info = Orginfo.find(1)
org_info.image.attach(io: File.open("/assets/dlcf_logo-d16a2c8a22ef43fb7d7e7459c93141037b0f19df65d9c82f1b23722bbf9dac6b.jpg"), filename: 'dlcf_logo.jpg', 
                      content_type: 'image/jpg'
)
org_info.file.attach(io: File.open("/assets/dlcf_charter-03398f43685a0a1c5ddbf44c7b6a9b495d9fdac7d632a91075699828d7a9423b.pdf"), 
                     filename: 'dlcf_charter.pdf', content_type: 'application/pdf'
)
