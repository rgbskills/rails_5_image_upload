class UploadsController < ApplicationController
    def index
        @upload = Upload.new
    end

    def create
        @upload = Upload.new(upload_params)
        if @upload.save
            render json: { message: "success", uploadId: @upload.id }, status: 200
        else
            render json: { error: @upload.errors.full_message.join(", ") }, status: 400
        end
    end

    def destroy
        @upload = Upload.find(params[:id])

        if @upload.destroy
            render json: { message: "File deleted from server" }
        else
            render json: { message: @image.errors.full_message.join(", ") }
        end

    end

    def list
        uploads = []
        Upload.all.each do |upload|
            new_upload = {
                id: upload.id,
                name: upload.image_file_name,
                size: upload.image_file_size,
                src: upload.image(:thumb)
            }
            uploads.push(new_upload)
        end

        render json: { images: uploads }
    end

    private
        def upload_params
            params.require(:upload).permit(:image)
        end
end
