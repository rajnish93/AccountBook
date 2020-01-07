[[params.social]]
icon = "linkedin"
icon_pack = "fa"
link = "//linkedin.com/in/krajnishsingh"

# AccountBook

Some module of Accounting ERP.

```sh
$ git clone https://github.com/byionline/AccountBook.git
$ cd AccountBook/Book_V_0.1
$ bundle install
$ rails db:drop db:create db:migrate db:seed
$ rails s
```

Your app should now be running on [localhost:3000](http://localhost:3000/).

### Video Link

https://lnkd.in/fnPDabt

# Features of AccountBook

### Devise

is used for Authentication and pundit is used for Authorization of different app module for different user levels (Admin, Billing,AccountEditor).

### We can be able to keep data separated for different company in the same single database using multi-tenant features without apartment gem.

### It does uses postgresql database for keeping data separated for different companies.

### Uses .csv files for seeding multiple records into database.

### pundit

is used for authorization based on different roles.
It helps to keep different views for different users without coding multiple views based on users roles.
Based on Users roles `pundit gem` allow user to access different parts of application hence prevent unauthorization.

### Example

If user role is `billing` only billing related view is allowed to access to the user rest part of application is restricted from the user.

### kaminari

is used for pagination in data

### Login

Any users are allowed to signup but only admin is allowed to provide permission to the new user for getting login to the website.
At First signup user is given a role as `Admin` and create a new `company`. Now users needs to change is permission to become admin of that company otherwise admin will not be able to select the company after next login. This is same for all user whose permission is changed
After first signup any user who signup is given a role as `default` & default users are not allowed to login to the site
