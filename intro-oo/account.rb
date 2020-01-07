require 'pry'

class Account
  attr_reader :id, :balance, :rate

  def initialize(id, balance)
    @id = id
    @balance = balance
    @rate = 0.05
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def withdraw(withdraw_amount)
    if @balance >= withdraw_amount
      @balance -= withdraw_amount
    else
      raise ArgumentError, "INSUFFICIENT FUNDS"
    end
  end

  def info
    <<~HEREDOC
      This account has ID of #{self.id},
      with balance #{@balance},
      and the interest rate is #{rate}
    HEREDOC
  end

  # def id
  #   @id
  # end
  #
  # def balance
  #   @balance
  # end
end

my_id = 22

acct = Account.new(55, 1200)
puts acct.id
puts acct.balance
acct.withdraw(1250)
puts acct.balance == 950
puts acct.balance

puts acct.info

# p acct

# print_id
# binding.pry
