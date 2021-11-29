# Description

This tech task allows a user to create a bank accounts and make actions on those accounts. Such as withdrawels, deposits and seeing transcations by printing statements.

## Domain model 

add domain model here

## Installation instructions 

To use this program you will need a version of Ruby installed

Clone this repo: 

```git clone {https://github.com/gjstirling/Bank-Tech-test.git}```

Install gems by running: 

```bundle install```

## Usage instructions 

First activate a REPL by entering the following into the command line inside the project directory: 
```irb```

Import the account class: 
```require './lib/account.rb'```

User can create a new bank account:
``` my_account = Account.new ```

User can deposit:
```my_account.deposit(10.0)```

Withdraw: 
```my_account.withdraw(5.0)``` 

print statement:
```my_account.statement``` 

A full tech task breakdown can be found at INSTRUCTIONS.md

## Feature test

To run the feature test enter the below command while in the root directory 
```ruby './feature_test.rb'```

## testing/linting

To run the unit tests 
```rspec```

To check linting 
```rubocop```








