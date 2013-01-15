Chef_Cookbook_Template
==========

Description
-----------
A template for Chef Cookbooks. Includes three gems: [chefspec](https://github.com/acrmp/chefspec), [fauxhai](https://github.com/customink/fauxhai), and [librarian-chef](https://github.com/applicationsonline/librarian).

Requirements
------------


Usage
-----
1. Clone this repo using `git clone git://github.com/anujbiyani/chef_cookbook_template.git -o YOUR_COOKBOOK_NAME`
2. Search and replace "chef_cookbook_template" with the name of your cookbook (preserve case if you want to be fancy)
3. Update the maintainer and maintainer_email in `metadata.rb`
4. Update YOUR_COMPANY_NAME towards the top of `recipes/default.rb`
5. Start TDD-ing your cookbook!

* If you want your specs to run against dependent cookbooks:
    1. add them to the `Cheffile`
    2. install them via `librarian-chef install`
    3. open `spec/spec_helper.rb`, then delete line 10 and uncomment lines 11 and 12.
* If you want to stub out dependent cookbooks:
    1. open `spec/spec_helper.rb` and uncomment lines 17, 18 and 19.
* If you don't have dependent cookbooks, then you need not do a thing!
