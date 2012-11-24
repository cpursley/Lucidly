class DreamsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :all, :show, :about]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  # GET /dreams
  # GET /dreams.json
  def index
    @dreams = Dream.where(:state => '1').search(params[:search]).order('accepted desc').paginate(:page => params[:page], :per_page => 10)  # published view

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dreams }
    end
  end

  def mydreams
    @mydreams = Dream.where(:state => ['0', '1']) # published view

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mydreams }
    end
  end

  # GET /dreams/1
  # GET /dreams/1.json
  def show
    @dream = Dream.find(params[:id])
    @comments = @dream.comments.all

  if user_signed_in?
    @rating_currentuser = @dream.ratings.find_by_user_id(current_user.id)
    unless @rating_currentuser 
      @rating_currentuser = current_user.ratings.new
    end
  end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dream }
    end
  end

  # GET /dreams/new
  # GET /dreams/new.json
  def new
    @dream = current_user.dreams.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dream }
    end
  end

  # GET /dreams/1/edit
  def edit
    @dream = current_user.dreams.find(params[:id])
  end

  # POST /dreams
  # POST /dreams.json
  def create
    @dream = current_user.dreams.new(params[:dream])

    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Dream was successfully created.' }
        format.json { render json: @dream, status: :created, location: @dream }
      else
        format.html { render action: "new" }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dreams/1
  # PUT /dreams/1.json
  def update
    @dream = current_user.dreams.find(params[:id])

    respond_to do |format|
      if @dream.update_attributes(params[:dream])
        format.html { redirect_to @dream, notice: 'Dream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    @dream = current_user.dreams.find(params[:id])
    @dream.destroy

    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :no_content }
    end
  end

  def about
  end
end
