class CommentsController < ApplicationController
	def create
		@comment = Comment.new(author_name: params[:comment][:author_name], body: params[:comment][:body])
		@comment.article_id = params[:article_id]

		@comment.save
		redirect_to article_path(@comment.article)
	end
end
