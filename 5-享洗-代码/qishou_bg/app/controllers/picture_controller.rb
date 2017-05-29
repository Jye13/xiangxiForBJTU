class PictureController < ApplicationController
  def up
  end

  def upload
    uploaded_io = params[:picture]
    File.open(Rails.root.join(uploaded_io.original_filename), "wb") do |file|
      file.write(uploaded_io.read)
    end
  end

  def tak
  end
end
