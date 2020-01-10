class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    self.balance=(self.balance + amount)
  end

  def withdraw(amount)
    self.balance=(self.balance - amount)
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end

  def close_account
    self.status = "closed"
  end

  def able_to_transfer?(amount)
    self.balance >= amount
  end

  def transfers_where_sender
    Transfer.all.select do |transfer|
      transfer.sender.name == self.name
    end
  end

  def transfers_where_receiver
    Transfer.all.select do |transfer|
      transfer.receiver.name == self.name
    end
  end

  def my_receivers
    # List all who have received money from me
    # First, where are all the transfers where I was the sender?
    self.transfers_where_sender.map do |transfer|
      transfer.receiver
    end
  end

  def my_senders
    self.transfers_where_receiver.map do |transfer|
      transfer.sender
    end
  end
end
