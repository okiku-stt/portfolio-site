class Schedule < ApplicationRecord
  belongs_to :company
  validates :settle_year,:settle_month,:company_tax,:consumption_tax, presence: true
  def settle_payment_year
    if settle_month > 10
      settle_year + 1
    else
      settle_year
    end
  end

  def center_payment_year
    if settle_month > 4
      settle_year + 1
    else
      settle_year
    end
  end

  def first_payment_year
    if settle_month > 7
      settle_year + 1
    else
      settle_year
    end
  end

  def third_payment_year
    if settle_month > 1
      settle_year + 1
    else
      settle_year
    end
  end

  def settle_payment_month
    if settle_month > 10
      settle_month - 10
    else
      settle_month + 2
    end
  end

  def center_payment_month
    if settle_month > 4
      settle_month - 4
    else
      settle_month + 8
    end
  end

  def first_payment_month
    if settle_month > 7
      settle_month - 7
    else
      settle_month + 5
    end
  end

  def third_payment_month
    if settle_month > 1
      settle_month - 1
    else
      settle_month + 11
    end
  end

  def settlement_alert
    now = Time.current
    today_year = now.year
    today_month = now.month    
    if today_year == settle_year && today_month == settle_month
      return "今月末に納税があります。"
    else
      return "納税期限はすでに超過しています。"
    end
  end
end
