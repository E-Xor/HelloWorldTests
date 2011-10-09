module MyStoreHelper

  def currency(price)

    # Adds price sign currently

    sprintf("$%0.02f", price)

  end

end
