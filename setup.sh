#!/human

# create new app with rails 4.2.3
rails _4.2.3_ new todolists

cd todolists
echo "group :test do" >>Gemfile
echo "\tgem 'rspec-rails', '~> 3.0'" >>Gemfile
echo "end" >>Gemfile

bundle

rails generate rspec:install

echo "--format documentation" >>.rspec

mv Gemfile Gemfile.orig
cp ../graded-assignments/course02/module02/assignment01-ActiveRecord-Relations/Gemfile ./

bundle

cp ../graded-assignments/course02/module02/assignment01-ActiveRecord-Relations/spec/*.rb ./spec/

rspec

#
# set up models, etc.
rails generate model user username:string password_digest:string
rake db:migrate
rspec -e rq02

rails generate model profile gender:string birth_year:integer first_name:string last_name:string user:references
rake db:migrate
rspec -e rq03

rails generate model TodoList list_name:string list_due_date:date
rake db:migrate
rspec-e rq04

rails generate migration AddUserToTodoList user:references
rake db:migrate
rspec -e rq05

rails generate model TodoItem due_date:date title:string description:text completed:boolean todo_list:references
rake db:migrate
rspec -e rq06

#
# submission
#
cd ..   # that's right.. ignore the directions and go up a level
zip -r submit.zip todolists/
