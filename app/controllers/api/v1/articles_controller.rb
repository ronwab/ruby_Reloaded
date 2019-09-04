
module Api
  module V1
    class ArticlesController <ApplicationController
      # aded this to prevent some erros.just googled
      protect_from_forgery with: :null_session

      # lists all articles
      def index
        articles =Article.order('created_at DESC');
        render json: {status: "Success", message: 'loaded articles', data:articles}, status: :ok
      end
      # show specific article
      def show
        article = Article.find(params[:id])
        render json: {status: "success", message: "Here is your article", data:article},status: :ok
      end
      # create a new article
      def create
        article = Article.new(articles_params)

        if article.save
          render json: {status: "success", message: "Here is your Saved article", data:article}
        else
          render json: {status: "error", message: "article not saved",data: article.errors}, status: "kubaf"
        end
      end
      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json:{status: "Success", message: "Deleted was successfull", data:article}, status: :ok
      end
    end
    private
    def articles_params
      params.permit(:title, :body)
    end
  end
end
