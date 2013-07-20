class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_authority, only: [:edit, :update, :destroy]

  def index
    # TODO: show all items order by popularity or give user a suggest list
    # TODO: random collection
    #@items = Item.all.page params[:page]
    if params[:all]
      @items = Item.all.page params[:page]
    else
      @items = current_user.items.page params[:page]
      render 'index_progress'
    end
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :total, :subtitle, :author, :category, :url, :image, :description, :progress)
    end

    def check_authority
      redirect_to @item, notice: "This item is not belongs to you, you can't doing any changes with it." unless current_user == @item.user
    end
end
