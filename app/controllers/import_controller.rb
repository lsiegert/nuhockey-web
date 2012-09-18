class ImportController < ApplicationController
  require 'csv'
  
  def file_upload
    if request.post? && params[:file].present?
      
      require 'fileutils'
      Rails.logger.info("PARAMS: #{params.inspect}")
      tmp = params[:file].tempfile
      file = File.join("public", params[:file].original_filename)
      FileUtils.cp tmp.path, file
    
      # YOUR PARSING JOB
      CSV.foreach(file) do |row|
        g=Game.new
        g._id=row[0]
        g.date=row[1]
        g.season=row[2]
        g.opponent=row[3]
        g.nuscore=row[4]
        g.oppscore=row[5]
        g.location=row[6]
        g.deleted=row[7]
        g.save
      end
    
      flash.now[:message]="CSV Import Successful,  new records added to data base"
      # BLORP
    
      FileUtils.rm file
      redirect_to "/games"
    else
      redirect_to "/"
    end
    
  end
end