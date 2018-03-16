

user_1 = User.create(username: "pam", email: "pam@gmail.com", password: "pampam")
user_2 = User.create(username: "amy", email: "amy@gmail.com", password: "amyamy")
user_3 = User.create(username: "tom", email: "tom@gmail.com", password: "tomtom")


cat_1 = Category.create(name: "Transportation")
cat_2 = Category.create(name: "Animal Care")
cat_3 = Category.create(name: "Boating")
cat_4 = Category.create(name: "Future")

user_1.ideas.create(content: "Hoverboard with drink dispenser", category: cat_4)
user_2.ideas.create(content: "Sharks with laserbeams", category: cat_2)
user_3.ideas.create(content: "Bus with hammocks", category: cat_1)
