# frozen_string_literal: true

require '/Users/graemestirling/TechTests/bank/lib/account'
require 'timecop'

account = Account.new
Timecop.freeze(Time.parse('10/01/2012')) do
  account.deposit(1000.00)
end
Timecop.freeze(Time.parse('13/01/2012')) do
  account.deposit(2000.00)
end
Timecop.freeze(Time.parse('14/01/2012')) do
  account.withdraw(500.00)
end
account.statement
