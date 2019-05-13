class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit destroy]
  before_action :find_categories, only: %i[new edit create]
  before_action :find_tests, only: %i[new edit create]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    badge = Badge.new(badge_params)
    if badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success_destroy')
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image, :category, :element, :condition)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_categories
    @categories = Category.all
  end

  def find_tests
    @tests = Test.all
  end

end
