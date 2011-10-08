# encoding: utf-8
u = User.new :first_name => 'Norbert', :last_name => 'Wojtowicz',
             :email => 'a@b.com', :password => 'secret', :password_confirmation => 'secret'
u.role = 'admin'
u.save! unless User.count > 0

City.find_or_create_by_city('Wrocław')
