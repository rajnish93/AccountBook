# AccountBook

Some module of Accounting ERP.


```sh
$ git clone https://github.com/byionline/AccountBook.git
$ cd AccountBook/Book_V_0.1
$ bundle install
$ bundle exec rake db:create db:migrate db:seed
$ rails s
```

Your app should now be running on [localhost:3000](http://localhost:3000/).

# Features of AccountBook

### Devise is used for Authentication and pundit is used for Authorization of different app module for different user levels (Admin, Billing, AccountEditor).
### We can be able to keep data separated for different company in the same single database using multi-tenant features without apartment gem.
### It doesnot uses postgresql schemas features for keeping data separated for different companies.
### Uses .csv files for seeding multiple records into database.
