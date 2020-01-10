require_relative 'bank_account'
require_relative 'transfer'

# create a few accounts to test

duke = BankAccount.new("Duke")
libby = BankAccount.new("Libby")
ben = BankAccount.new("Ben")
wally = BankAccount.new("Wally")

# create some transfers to test (with various statuses)

duke_to_libby = Transfer.new(duke, libby, 100)
duke_to_libby.execute_transaction
# spot check that transfers are "complete" after execution step
# p duke_to_libby

duke_to_wally = Transfer.new(duke, wally, 200)
duke_to_wally.execute_transaction
duke_to_wally.reverse_transfer
# spot check status of reversed transfer
# p duke_to_wally

duke_to_ben = Transfer.new(duke, ben, 125)
libby_to_ben = Transfer.new(libby, ben, 150)
libby_to_duke = Transfer.new(libby, duke, 75)
wally_to_duke = Transfer.new(wally, duke, 50)

# Many to many time! An account has many transfer receivers, and it ALSO has many transfer senders! Let's play.

# First, can I find all the transfers associated with my account?

Transfer.all

# p duke.transfers_where_sender
# p duke.transfers_where_receiver

# p duke.my_receivers

p duke.my_senders


# Next, can I find all the people I've sent money to?

# duke.transfer_receivers

# Finally, what about everyone who sent money to me?

# duke.transfer_senders
