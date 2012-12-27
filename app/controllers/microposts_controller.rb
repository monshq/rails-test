class MicropostsController < ApplicationController

  before_filter :signed_in_user #,  only: [:create, :destroy, :index]
  before_filter :correct_user,    only: [:destroy]
  before_filter :admin_user,      only: [:index]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @microposts }
    end
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @micropost }
    end
  end

  # GET /microposts/new
  # GET /microposts/new.json
  def new
    @micropost = Micropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @micropost }
    end
  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.find(params[:id])
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = current_user.microposts.build(params[:micropost])  #Micropost.new(params[:micropost])

    respond_to do |format|
      if @micropost.save
        flash[:success] = 'Micropost was successfully created.'
        format.html { redirect_to :back }
        format.json { render json: @micropost, status: :created, location: @micropost }
      else
        format.html { redirect_to "home" } #:back }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /microposts/1
  # PUT /microposts/1.json
  def update
    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to @micropost } #, notice: 'Micropost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

private

  def correct_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    if @micropost.nil? and !current_user.admin?
      redirect_to root_path, notice: 'Cant touch this'
    end
  end

  def admin_user
    unless current_user.admin?
      redirect_to '/home'
    end
  end
end
