# Bank tech test

**Bank tech test** is a small simulation a basic bank account.

The program accepts the user inputting either a deposit or a withdrawal of money (the user can specify a date for this transaction or it will default to todays date). The program then creates a log of that transaction listing the date of transaction, the type (deposit/withdrawal), the amount deposited/withdrawn and the account balance at the end of that transaction.  The user can then print a statement which will use this log to provide a table of transactions (in reverse chronological order) with a date, credit, debit and balance row.

This program was built  using **TDD** as part of [**Makers Academy Coding Bootcamp**]([http://makers.tech](http://makers.tech/)).



Describe how to install dependencies, run your tests, and run the project?

Describe your approach?

Describe how you structured your code and why?

Account - acts a controller redirecting user to either Transaction (deposit/withdraw) or Statement (view). This means the user does not need to understand the split in functionality between the classes in order to use all features available (and does not need to instantiate each class separately).

Transaction - allows user to add/subtract from the balance through deposit/withdraw transactions

Log - stores a log of above transactions

Statement - converts log into statement table

Date - provides today's date in correct format

Splitting between Transaction, log and Statement classes preserves SRP. Having a single Account class that provides access to these simplifies the user's expirience - the user does not need to understand the split in functionality between the classes in order to use all features available. 

Include a screenshot of your running app?

Have reasonable spelling & grammar?



# Split out log



Split create_transaction from add_to_log (might be redundent after Log class) - check methods as short as possible



## Installation

This program requires **Ruby version 3.0.0**. If you are unsure if you have Ruby installed, or need help seeing the version you are using [codecademy](https://www.codecademy.com) provide this useful guide to [**setup Ruby**](https://www.codecademy.com/articles/ruby-setup).

To run tests the following gems will need to be installed using `bundler` (not required to run program without testing):

* rspec
* rubocop
* rubocop-rspec
* simplecov

## Specification

### Requirements

* User should interact using IRB  (there will not be a command line interface that takes input from STDIN.)
* User can make deposits
* User can make withdrawrals
* Output will be an account statement showing date, credits, debits and balance
* Data will be kept in memory (not stored to a database or output files)

### Example

A client makes a **deposit** of **1000** on 10-01-2012 
And a **deposit** of **2000** on 13-01-2012 
And a **withdrawal** of **500** on 14-01-2012 
When the client prints thier bank statement  they would see:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Usage

The above example would be implimented as below on the command line:

```sh
$ irb -r './lib/account.rb'
3.0.0 :001> current_ac = Account.new
3.0.0 :002> current_ac.deposit(1000, '10/01/2012')
3.0.0 :003> current_ac.deposit(2000, '13/01/2012')
3.0.0 :004> current_ac.withdraw(500, '14/01/2012')
3.0.0 :005> current_ac.statement
 => "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
```

## Running Tests

```zsh
# install test gems
$ bundle
# To run spec tests and check code coverage
$ rspec
# To run Ruby style checker (linter) and formatter
$ rubocop
```

## Development / Contributing

This project was created as a learning exercise as part of the Makers Academy Coding Bootcamp. 

No further development is planned on this project and pull requests are not sought (sorry🤗).