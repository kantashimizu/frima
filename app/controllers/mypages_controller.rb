class MypagesController < ApplicationController

  before_action :set_action,:set_address

  # マイページ／一覧
  def index
    @products = Product.where(user_id:current_user)
    @categories = Category.all
  end

  # 本人確認
  def identification
    @categories = Category.all  
    @addresses = Address.new
    @address = Address.find_by(user_id: current_user.id)
  end

  # SNS認証ページ(APIでfacebookやtwitterアカウントでのログインを行う)
  def sns

  end

  def new
    @addresses = Address.new
  end

  def create
    @addresses = Address.new(address_params)
    if @addresses.save
      redirect_to new_card_path
    else
      render 'new'
    end
  end


  # お知らせ
  def notification

  end

  # やることリスト
  def todo

  end

  # 出品した商品 - 出品中
  def listing
    @products = Product.where(user_id:current_user)
  end

  # 出品した商品 - 取引中
  def progress
    @products = Product.where(user_id:current_user)
  end

  # 出品した商品 - 売却済み
  def completed
    @products = Product.where(user_id:current_user)
  end

  # 購入した商品 - 取引中
  def buying
    @products = Product.where(user_id:current_user)
  end

  # 購入した商品 - 過去の取引
  def pastransaction
    @products = Product.where(user_id:current_user)
  end

  # ニュース一覧
  def news

  end

  # 評価一覧
  def evaluates

  end

  def edit
    
  end

  def up
   
    if @address.update(address_params)
      redirect_to root_path
    else
    end
  end
  # お問い合わせ
  def support

  end

  # ポイント
  def points

  end

  # プロフィール
  def profile
  end

  # 電話番号の確認
  def confirmation

  end

  # ログアウト
  def destroy
  end


  # ログイン画面ボタンいっぱい
  def loginbutton
  end

  #
  def tell
   
  end

  def tellup
   
    if @address.update(address_params)
      redirect_to root_path
    end
  end

  # 新規登録の完了画面
  def done
  end

  def  update
    if current_user.update(user_params)
      redirect_to mypages_profile_path
    else
      
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:profile)
  end

    def set_action
      @productsimage = Productsimage.all
      @categories = Category.all
      @brands = Brand.all
    end
    def set_address
      @address = Address.find_by(user_id:current_user)
    end
    def address_params
      params.require(:address).permit(:postnum,:prefecture,:city,:street_num,:building,:tel,:family_name_knj,:first_name_knj,:family_name_ktkn,:first_name_ktkn)
      .merge(user_id: current_user.id)
    end

end
