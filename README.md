# Description

This is a tech task to create a command line program that works to the following specification: 

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

# Installation instructions 

To use this program you will need a version of Ruby installed

Clone this repo: 

```git clone {https://github.com/gjstirling/Bank-Tech-test.git}```

Install gems by running: 

```bundle```

Check tests by entering 
```rspec```

# Usage instructions 

User can create a new bank account:
``` my_account = Account.new ```

User can deposit:
``` my_account.deposit(10.0) ```

Withdraw: 
``` my_account.withdraw(5.0) ``` 

print statement:
``` my_account.statement ``` 

A full tech task breakdown can be found at INSTRUCTIONS.md



