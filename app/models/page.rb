class Page < Notifier
  attr_accessor :page, :token, :account

  def initialize(message)
    super
  end

  def send!
    page.feed!(message: message)
  end

  def page
    @page ||= FbGraph::User.me(@tok)
  end

  def token
    @token ||= acct.access_token
  end

  def account
    @account ||= FBOOK.accounts.detect{|x| x.name == 'Isbradinindy'}
  end
end