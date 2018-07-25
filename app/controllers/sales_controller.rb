class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @discount = @sale.value.to_i * (@sale.discount.to_f/100)
    @sale.total = @sale.value.to_i - @discount

    if @sale.tax == false
      @sale.total.to_f *= 1.19
      @sale.tax = 19
    elsif
      @sale.tax = 0
    end

    @sale.save
    redirect_to sales_done_path
  end

  def done
    @sale = Sale.last
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end

  def apply_discount
  end

  def apply_tax


  end

end
