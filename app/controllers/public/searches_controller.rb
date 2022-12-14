class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @word = params[:word]
    @range = params[:range]
    if @range == "注文"
      @orders = current_user.orders.search(params[:word]).page(params[:page]).per(10)
    elsif @range == "事務員"
      @admins = Admin.where.not(login_id: 'guest@example').where(is_deleted: 'false').search(params[:word]).page(params[:page]).per(10)
    elsif @range == "商品"
      @items = Item.search(params[:word]).page(params[:page]).per(9)
      @genres = Genre.all
    end
  end

end
