class VideoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	before_action :video_cats_id, only: [:edit, :update, :destroy]

	respond_to :json

	def index
		@video_cats = VideoCategory.order_by_position.includes(:videos)
		respond_with @video_cats.to_json(methods: [:image_url]), status: 200
	end

	def create
		@video_cat = VideoCategory.new(video_category_params)

		if @video_cat.save
			respond_with @video_cat, status: 200
		else
			respond_with errors: @video_cat.errors.full_messages, status: 422
		end

	end

	def edit
		respond_with @video_cat.to_json(methods: [:image_url])
	end

	def update
		respond_with @video_cat.update(video_category_params).to_json(methods: [:image_url]), json: {message: "success", url: @video_cat.image_url, id: @video_cat.id, status: 200}
	end

	def destroy
		respond_with @video_cat.destroy, status: 200
		
	end

	def sort
    params[:video_category].each_with_index do |id, index|
      VideoCategory.where(id: id).update_all({position: index + 1})
    end
    render nothing: true
  end

	private
		def video_category_params
			params.require(:video_category).permit(:name, :position, :image, :id)
		end

		def video_cats_id
			@video_cat = VideoCategory.find(params[:id])
		end
end
