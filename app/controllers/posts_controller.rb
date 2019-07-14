class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order(created_at: :desc)
    @new_posts = Post.all.order(created_at: :desc).limit(5)
  end
  def new
    @post = Post.new # フォーム用の空のインスタンスを生成する。
  end

  def create
    @post = Post.new(post_params) # ストロングパラメータを引数に
    if @post.save # saveをしてデータベースに保存する。
      redirect_to @post, notice: "ブログを登録したぜえええ。" # showページにリダイレクト
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    
    if @post.update(post_params)
      redirect_to @post, notice: "ブログを更新しました。"
    else
      render :edit
    end
  end
  def destroy
    
    @post.destroy
    redirect_to posts_path, notice: "ブログを削除しちゃったよん。"
  end

  private

  def post_params # ストロングパラメータを定義する
    params.require(:post).permit(:title, :body)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end

