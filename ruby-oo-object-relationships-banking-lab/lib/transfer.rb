class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && self.valid? && sender.able_to_transfer?(amount)
      self.sender.withdraw(amount)
      self.receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.withdraw(amount)
      self.sender.deposit(amount)
      self.status = "reversed"
    end
  end
end
