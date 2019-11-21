class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  def valid?
    sender.valid? && receiver.valid? ? true : false 
  end 
  
  def execute_transaction 
    if self.status == "pending"
      self.sender.deposit(-1*self.amount)
    if self.valid?
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.sender.deposit(self.amount)
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
   end
  end
end

   def reverse_transfer
    if @status == "complete"
     @sender.balance += @amount
     @receiver.balance -= @amount
     @status = "reversed"
    end
  end 
 
end
