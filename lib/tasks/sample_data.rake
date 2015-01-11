namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
   make_sermons
   make_roles
   make_teams
   make_users
  end
end

def make_roles
  r = Role.new
  r.name = "Worship"
  r.save
  r = Role.new
  r.name = "Media"
  r.save
end

def make_teams
  t = Team.new
  t.name = "Team A"
  t.save
  t = Team.new
  t.name = "Team B"
  t.save
end

def make_users
  make_andy
  make_matt
  make_creighton
end

def make_andy
  u = User.new
  u.first_name = "Andy"
  u.last_name = "Perez"
  u.email = "agperez@gmail.com"
  u.password = "caseyokeefe"
  u.password_confirmation = "caseyokeefe"
  u.admin = true
  role = Role.find_by_name("Worship")
  u.role_id = role.id
  team = Team.find_by_name("Team A")
  u.team_id = team.id
  u.save
end

def make_matt
  u = User.new
  u.first_name = "Matt"
  u.last_name = "Thompson"
  u.email = "matt@mattathompson.org"
  u.password = "caseyokeefe"
  u.password_confirmation = "caseyokeefe"
  u.admin = true
  role = Role.find_by_name("Media")
  u.role_id = role.id
  team = Team.find_by_name("Team B")
  u.team_id = team.id
  u.save
end

def make_creighton
  u = User.new
  u.first_name = "Creighton"
  u.last_name = "Vaughn"
  u.email = "creightonvaughn@gmail.com"
  u.password = "caseyokeefe"
  u.password_confirmation = "caseyokeefe"
  u.admin = true
  role = Role.find_by_name("Media")
  u.role_id = role.id
  team = Team.find_by_name("Team B")
  u.team_id = team.id
  u.save
end

def make_sermons
  500.times do
    book = ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy",
            "Joshua", "Judges", "Ruth", "1 Samuel", "2 Samuel", "1 Kings",
            "2 Kings", "1 Chronicles", "2 Chronicles", "Ezra", "Nehemiah",
            "Esther", "Job", "Psalms", "Proverbs", "Ecclesiastes",
            "Song of Solomon", "Isaiah", "Jeremiah", "Lamentations",
            "Ezekiel", "Daniel", "Hosea", "Joel", "Amos", "Obadiah",
            "Jonah", "Micah", "Nahum", "Habakkuk", "Zephaniah", "Haggai",
            "Zechariah", "Malachi", "Matthew", "Mark", "Luke", "John",
            "Acts", "Romans", "1 Corinthians", "2 Corinthians",
            "Galatians", "Ephesians", "Philippians", "Colossians",
            "1 Thessalonians", "2 Thessalonians", "1 Timothy",
            "2 Timothy", "Titus", "Philemon", "Hebrew", "James", "1 Peter",
            "2 Peter", "1 John", "2 John", "3 John", "Jude", "Revelation"].sample


    s_date = rand(Date.new(2014, 1, 1)..Date.new(2014,12,31))
    chapter = rand(1..50)
    verse_first = rand(1..10)
    verse_last = rand(11..40)
    outline = Faker::Lorem.paragraph(10)
    Sermon.create!(
      book: book,
      s_date: s_date,
      chapter: chapter,
      verse_first: verse_first,
      verse_last: verse_last,
      outline: outline
      )

  end
end
