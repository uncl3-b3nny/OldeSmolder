# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# fake_users = 
z = 1

5.times do 
  password = "password14"
  User.create([{
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password, 
    anniversary: (Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)).to_date), 
    spouse_birthday: (Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)).to_date), 
    first_kiss: (Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)).to_date), 
    first_date: (Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)).to_date), 
    day_you_proposed:(Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)).to_date)
  }])

  fake_suggestions = 
    5.times do
      Suggestion.create([
      {
        primary_category: 'Quality Time', 
        primary_subcategory: 'memories', 
        content: 'remember that really romantic evening we had...', 
        user_id: z, 
        workflow_state: "not_done",
        suggestion_image_file_path: '/assets/other_images/olive-mountain.png',
        content_title: "Go on a Hike!"
      },

      {
        primary_category: 'Quality Time', 
        primary_subcategory: 'schedule', 
        content: 'this is a suggestion for a fun date!', 
        user_id: z, 
        workflow_state: "not_done",
        suggestion_image_file_path: '/assets/other_images/lady_and_the_tramp.png',
        content_title: "Schedule a date!"
      },

      {
        primary_category: 'Words of affirmation', 
        primary_subcategory: 'Poetry', 
        content: 'If poetry be the food of love...', 
        user_id: z, 
        workflow_state: "not_done",
        suggestion_image_file_path: '/assets/other_images/Poetry.png',
        content_title: "Send some poetry!"
      },

      {
        primary_category: 'Words of affirmation', 
        primary_subcategory: 'Send a letter!', 
        content: Faker::Company.bs, 
        user_id: z, 
        workflow_state: "not_done",
        suggestion_image_file_path: '/assets/other_images/writing-a-letter.jpg',
        content_title: 'Send a letter!'
      },

      {
        primary_category: 'Tangible Gifts', 
        primary_subcategory: Faker::Commerce.department(1, 
        true), 
        content: Faker::Commerce.product_name + ": $" + ((Faker::Commerce.price).to_s), 
        user_id: z, 
        workflow_state: "not_done" 
      },

      {
        primary_category: 'Acts of Service', 
        primary_subcategory: 'Domestic', 
        content: 'Fix the ' + Faker::Hacker.noun, 
        user_id: z, 
        workflow_state: "not_done" 
      },

      {
        primary_category: 'Physical Touch', 
        primary_subcategory: 'Reminder', 
        content: 'Give your wife a hug today!', 
        user_id: z, 
        workflow_state: "not_done" 
      },

      {
        primary_category: 'Physical Touch', 
        primary_subcategory: 'Ideas', 
        content: 'Holding hands is simple way to remind her you love her!', 
        user_id: z, 
        workflow_state: "not_done" 
      }
    ])
  end

  Event.create([
    {
      user_id: z, 
      title: "Mother's Day", 
      start: '2013-05-10', 
      event_type: 'Holiday', 
      workflow_state: "done", 
      notes: "Sent her poetry", 
      history_image_file_path: "/assets/other_images/Poetry.png" 
    }, 

    {
      user_id: z, 
      title: "Labor Day", 
      start: '2013-09-07', 
      event_type: 'Holiday', 
      workflow_state: "done", 
      notes: "We went hiking at Nantahala national forest!", 
      history_image_file_path: "/assets/other_images/olive-mountain.png" 
    }, 

    {
      user_id: z, 
      title: "Independence Day", 
      start: '2016-07-04', 
      event_type: 'Holiday', 
      workflow_state: "not_done" 
    }, 

    {
      user_id: z, 
      title: "New Year's Day", 
      start: '2014-01-1', 
      event_type: 'Holiday', 
      workflow_state: "not_done" 
    }, 

    {
      user_id: z, 
      title: "Black Friday", 
      start: '2015-11-28 6:30:00', 
      event_type: 'Holiday', 
      workflow_state: "not_done" 
    }, 

    {
      user_id: z, 
      title: "Anniversary", 
      start: '2016-11-27 7:30:00', 
      event_type: 'Holiday', 
      workflow_state: "not_done" 
    }, 

    {
      user_id: z, 
      title: "Cyber Monday", 
      start: '2016-12-01 8:30:00', 
      event_type: 'Holiday', 
      workflow_state: "not_done" 
    }, 

    {
      user_id: z, 
      title: "Christmas", 
      start: '2013-12-25', 
      event_type: 'Holiday', 
      workflow_state: "done", 
      notes: "Bought her chapstick", 
      history_image_file_path: "/assets/other_images/chapstick.png"
    }
  ])
  z += 1
end
  #maybe just a write a script to scrape poetry foundation?



















