namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
   make_sermons
   #make_users
  end
end

def make_users
  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
    end
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
