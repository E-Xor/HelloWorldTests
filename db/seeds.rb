# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

MyTestScaffold.delete_all

MyTestScaffold.create(:title => 'Programming Ruby 1.9' ,
  :description => %{
Ruby is the fastest growing and most exciting dynamic language out there. If you need to get working programs delivered fast, you should add Ruby to your toolbox.
  },
  :image_url => '/images/ruby.jpg' ,
  :price => 49.50
)

MyTestScaffold.create(:title => 'Web Design for Developers' ,
  :description => %{
Web Design for Developers will show you how to make your web-based application look professionally designed. We'll help you learn how to pick the right colors and fonts, avoid costly interface and accessibility mistakes - your application will really come alive. We'll also walk you through some common Photoshop and CSS techniques and work through a web site redesign, taking a new design from concept all the way to implementation
  },
  :image_url => '/images/wdfd.jpg' ,
  :price => 42.95
)

