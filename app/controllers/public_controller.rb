class PublicController < ActionController::Base
  def index
    @recipes = Recipe.includes(:recipeFoods).where(public: true).order('created_at DESC')
  end
end
