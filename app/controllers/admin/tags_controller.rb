class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tags = Tag.all
    @tag_new = Tag.new
  end

  def create
    @tag_new = Tag.new(tag_params)
    if @tag_new.save
      redirect_to admin_tags_path
      flash[:notice] = "タグ名を追加しました。"
    else
      @tags = Tag.all
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path
      flash[:notice] = "編集した内容を保存しました。"
    else
      render :edit
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end