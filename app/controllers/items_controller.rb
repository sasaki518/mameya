class ItemsController < ApplicationController
    
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    
    def index
        @items = Item.all
    end
    
    def show
    end
    
   def new
       @item = Item.new
   end
   
   def create
       item_params = params.require(:item).permit(:image, :itemname, :description, :price, :gram, :roasting, :sourness, :bitterness, :aroma, :body, :aftertaste)
       @item = Item.new(item_params)
       if @item.save
           flash[:notice] = "商品を一件登録しました。"
           redirect_to items_path
       else
           flash.now[:alert] = "商品の登録に失敗しました。"
           render :new
       end
   end
   
   def edit
   end
   
   def update
       item_params = params.require(:item).permit(:image, :itemname, :description, :price, :gram, :roasting, :sourness, :bitterness, :aroma, :body, :aftertaste)
       if @item.update(item_params)
           flash[:notice] = "商品情報を更新しました。"
           redirect_to items_path
       else 
           flash.now[:alert] = "更新に失敗しました。"
           render :edit
       end
   end
   
   def destroy
       @item.destroy
       flash[:notice] = "削除しました。"
       redirect_to items_path
   end
   
   private
   
   def set_item
       @item = Item.find(params[:id])
   end
end