module ApplicationHelper
  def format_cents(cents)
    money = Money.new(cents, 'AUD')
    money.format
  end
end
