class UploadsController < ApplicationController
  
require 'aws-sdk'
      



  def new
  end

  def create
 
  bucket = "orifamiliar"
  s3 = Aws::S3::Resource.new(region: 'us-east-1')
  
  # Get just the file name
  name = File.basename(params[:file].path)
  
  # Create the object to upload
  obj = s3.bucket(bucket).object(name)
  
  # Upload it      
  obj.upload_file(params[:file].path)
  
  # Create an object for the upload
    @upload = Upload.new(
    		url: obj.public_url,
		    name: obj.key
    	)


    # Save the upload
    if @upload.save
      redirect_to uploads_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
    @uploads = Upload.all
  end
end
