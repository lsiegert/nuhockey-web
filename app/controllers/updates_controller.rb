class UpdatesController < ApplicationController

  # GET /updates/20111008232210  Time in UTC 24 hour format
  def since
    input = params[:time]
    
    return render :text => "Bad date" if input.length != 14
    
    begin
      @datetime = input.to_datetime
    rescue
      return render :text => "Bad date"
    end
    
    # New games
    @newgames = Game.where("created_at >= :datetime AND deleted = :deleted",
                            {:datetime => @datetime, :deleted => false})
                            
    # Updated games
    @updatedgames = Game.where("updated_at >= :datetime AND created_at < :datetime AND deleted = :deleted",
                              {:datetime => @datetime, :deleted => false})
    
    # Deleted games
    @deletedgames = Game.where("updated_at >= :datetime AND created_at < :datetime AND deleted = :deleted",
                              {:datetime => @datetime, :deleted => true})
  end
end