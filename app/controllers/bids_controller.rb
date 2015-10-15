class BidsController < ApplicationController

  def create
    @bid = Bid.create!(bid_params)
    redirect_to @bid.item do |format|
      format.html
      format.ajax { dataType 'html'}
    end

    # if @bid.save
    #   redirect_to @bid.item, notice: 'Your bid has been recorded!'
    # else
    #   @item = @bid.item
    #   render "items/show"
    # end
  end


  private
    # Only allow a trusted parameter "white list" through.
    def bid_params
      params.require(:bid).permit(:amount, :item_id)
    end
end
