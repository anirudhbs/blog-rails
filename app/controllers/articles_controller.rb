class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /articles
  def index
    @pagy, @articles = pagy_countless(Article.publish, link_extra: 'data-remote="true"')
  end

  # GET /articles/1
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.submitting if params[:state] == 'Submit'

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      @article.submitting if params[:state] == 'Submit'

      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  def delete_attachment
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    respond_to do |format|
      format.html { redirect_to article_url(params[:article_id]), notice: 'Attachment was successfully destroyed.' }
    end
  end

  def my_articles
    @pagy, @articles = pagy(Article.where('user_id=?', current_user.id))
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, attachments: [])
  end
end
