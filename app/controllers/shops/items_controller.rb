class Shops::ItemsController < ShopController
    
    
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    
    def index
        @items = current_shop.items
        @items = @items.where(itemname: params[:itemname]) if params[:itemname].present?
        render :layout => "shop"
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
   def new
       @item = Item.new
       render :layout => "shop"
   end
   
   def create
       item_params = params.require(:item).permit(:image, :itemname, :description, :price, :gram, :roasting, :sourness, :bitterness, :aroma, :body, :aftertaste)
       item_params[:shop_id] = current_shop.id
       @item = Item.new(item_params)
       if @item.save
           flash[:notice] = "商品を一件登録しました。"
           redirect_to shops_items_path
       else
           flash.now[:alert] = "商品の登録に失敗しました。"
           render :new
       end
       render :layout => "shop"
   end
   
   def edit
       render :layout => "shop"
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
       render :layout => "shop"
   end
   
   def destroy
       @item.destroy
       flash[:notice] = "削除しました。"
       redirect_to items_path
       render :layout => "shop"
   end
   
   private
   
   def set_item
       @item = Item.where(shop_id: current_shop.id).find(params[:id])
   end
   
  
end