# Bank tech test

**Bank tech test** is a small simulation a basic bank account. 

This program was built  using **TDD** as part of [**Makers Academy Coding Bootcamp**]([http://makers.tech](http://makers.tech/)).

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

Aclient makes a **deposit** of **1000** on 10-01-2012 
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