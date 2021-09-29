# Installation instructions 

(1) Clone this repo 
(2) Open folder inside the terminal 
(3) run 'bundle install' to install dependencies


# Usage instructions 

enter 'rspec' into terminal to confirm tests are funcitoning as expected 
open a REPL by entering 'irb' into the terminal 
type 'require './lib/bank.rb''
create a new bank 'bank = Bank.new'
create a client account 'client = Client.new("Test Client")'
store client inside bank 'bank.new_client(client)'
Deposit credit 'client.deposit(1000.00)'
Deposit credit 'client.deposit(2000.00)'
withdraw credit 'client.withdraw(1000.00)'
display bank statement 'client.print_statement' 


# Bank tech test User Stories 

As a client,
So that the bank knows who I am,
I want to associate my name with my account 

As a bank, 
So I can have many clients and banks, 
I'd like to store many clients in one bank

As a client, 
So that I can create savings, 
I'd like to deposit money into my new account 

As a client 
So that I can withdraw funds 
I'd like to withdraw credit

As a client 
So I can see my transactions 
I'd like to see my transaction history

As A client 
So I can keep track of my spending 
I'd like to see a date next to my transactions



