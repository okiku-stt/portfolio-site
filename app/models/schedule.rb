class Schedule < ApplicationRecord
  belongs_to :company
  validates :year,:month,:company_tax,:consumption_tax, presence: true
  def settle_payment_year
    if month > 10
      year + 1
    else
      year
    end
  end

  def center_payment_year
    if month > 4
      year + 1
    else
      year
    end
  end

  def first_payment_year
    if settlement_month > 7
      year + 1
    else
      year
    end
  end

  def third_payment_year
    if month > 1
      year + 1
    else
      year
    end
  end

  def settle_payment_month
    if month > 10
      month - 10
    else
      month + 2
    end
  end

  def center_payment_month
    if month > 4
      month - 4
    else
      month + 8
    end
  end

  def first_payment_month
    if month > 7
      month - 7
    else
      month + 5
    end
  end

  def third_payment_month
    if month > 1
      month - 1
    else
      month + 11
    end
  end

  def settlement_alert
    now = Time.current
    today_year = now.year
    today_month = now.month    
    if today_year == year && today_month == month
      return "今月末に納税があります。"
    else
      return "納税期限はすでに超過しています。"
    end
  end
end
