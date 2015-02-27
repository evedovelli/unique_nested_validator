# UniqueNestedValidator

[![Gem Version](https://badge.fury.io/rb/unique_nested_validator.svg)](http://badge.fury.io/rb/unique_nested_validator)
[![Build Status](https://travis-ci.org/evedovelli/unique_nested_validator.svg?branch=v1.0.1)](https://travis-ci.org/evedovelli/unique_nested_validator)
[![Code Climate](https://codeclimate.com/github/evedovelli/unique_nested_validator/badges/gpa.svg)](https://codeclimate.com/github/evedovelli/unique_nested_validator)


This validator allows you to verify the uniqueness of attributes from nested models.

## Installation

Add this line to your application's Gemfile:

    gem 'unique_nested_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unique_nested_validator

## Usage


Let's say you have a model for `Runner`:

    class Runner < ActiveRecord::Base
      attr_accessible :email

Then you create a `Race` and fill in runners using nested forms. In your `Race` model you will accept nested attributes for the nested model `Runner`:

    class Race < ActiveRecord::Base
      has_many :runners, :dependent => :destroy
      accepts_nested_attributes_for :products

If we want to warrant that there aren't two runners with the same id, so we add the following validation to `Race`:

      validates :products, :unique_nested => true

Or, if we want to warrant there aren't repeated emails for runners we add the following validation:

      validates :products, :unique_nested => { :with => :email }

And it is possible to set a custom error message:

      validates :products, :unique_nested => { :with => :email, :message => "Two runners cannot have the same email" }


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
