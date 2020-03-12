class FutureTax < ApplicationRecord
  belongs_to :company
  validates :sales,:profit_rate,:fix_cost, presence: true
  def operating_profit
    (sales * profit_rate / 100)
  end

  def ordinary_profit
    (operating_profit - fix_cost).to_i
  end

  def company_tax
    # 法人税 これ以降円単位で表示
    if ordinary_profit < 800
      (ordinary_profit * 0.15 * 10000).to_i
    else
      ((ordinary_profit * 0.232 * 10000) + 120).to_i
    end
  end

  def company_resident_tax
    # 法人都民税 令和元年10月から開始する事業年度より税率の引き下げ
    (company_tax * 0.07).to_i
  end

  def business_tax
    # 事業税
    if ordinary_profit < 400
      (ordinary_profit * 0.034).to_i
    elsif ordinary_profit < 400 && ordinary_profit > 800
      (ordinary_profit * 0.051).to_i
    else
      (ordinary_profit * 0.067).to_i
    end
  end

  def local_company_tax
    # 地方法人税
    # 令和元年10月から開始する事業年度より税率の引き上げ
    # https://www.nta.go.jp/publication/pamph/hojin/chihou_hojin/01.htm
    (company_tax * 0.103).to_i
  end

  def special_business_tax
    # 特別法人事業税
    # 令和元年10月から開始する事業年度より特別法人地方税が廃止、代わりに新設
    (business_tax * 0.37).to_i
  end

  def company_tax_all
    company_tax + company_resident_tax + business_tax + local_company_tax + special_business_tax
  end
end
