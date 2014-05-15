class Page < Notifier
  attr_accessor :account

  def initialize(message)
    super
  end

  def send!
    account.feed!(message: message)
  end

  def page
    @account ||= FBOOK.accounts.first
  end
end