class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show edit update destroy ]
  before_action :require_login, only: %i[new edit create update destroy]

  # GET /cats or /cats.json
  def index
    @cats = Cat.page(params[:page]).per(5)
  end

  # GET /cats/1 or /cats/1.json
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats or /cats.json
  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    if @cat.save
      flash[:success] = "Cat was successfully created."
      redirect_to @cat
    else
      render :new
    end
  end

  # PATCH/PUT /cats/1 or /cats/1.json
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:success] = "Cat was successfully updated."
      redirect_to @cat
    else
      render :edit
    end
  end

  # DELETE /cats/1 or /cats/1.json
  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    flash[:success] = "Cat was successfully deleted."
    redirect_to cats_url
  end

  private
    def require_login
      unless logged_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cat).permit(:name, :color)
    end
end
