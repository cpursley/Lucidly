class DreamsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :all, :show, :about]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  # GET /dreams
  # GET /dreams.json
  def index
    @dreams = Dream.where(:state => '4').paginate(:page => params[:page], :per_page => 8)
    @recent_dreams = Dream.recent

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dreams }
    end
  end

  def all
    @dreams = Dream.where(:state => ['3', '4']).search(params[:search]).order('accepted desc').paginate(:page => params[:page], :per_page => 8)
    @recent_dreams = Dream.recent
    
    respond_to do |format|
      format.html { render 'index' }                 
      format.json  { render :json => @dreams }
    end

    if params[:tag]
      @dreams = Dream.tagged_with(params[:tag])
    else
      @dreams = Dream.all
    end
  end

  def mydreams
    @mydreams = current_user.dreams.all

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

  # if an dream has already been accepted, the user is not allowed to change title and teaser
  if @dream.state > 2
    params[:dream].delete(:title)
    params[:dream].delete(:teaser)
  end

  respond_to do |format|
    if @dream.update_attributes(params[:dream])
      format.html { redirect_to(@dream, :notice => 'Dream was successfully updated.') }
      format.json  { head :ok }
    else
      format.html { render :action => "edit" }
      format.json  { render :json => @dream.errors, :status => :unprocessable_entity }
    end
  end
end

def submit
  @dream = current_user.dreams.find(params[:id])

  # submit only, if dream is currently in draft or rejected-state
  if (@dream.state == 0) or (@dream.state == 2)
    @dream.state = 1
    @dream.submitted = Time.now

    if @dream.save
      flash[:notice] = 'Your dream was successfully submitted for approval.'
    else
      flash[:error] = 'There was an error while submitting your dream.'   
    end           
  else
    flash[:error] = 'This dream can not be submitted.'  
  end

  respond_to do |format|
    format.html { redirect_to(:action => 'mydreams') }
    format.json  { head :ok }
  end
end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
   @dream = current_user.dreams.find(params[:id])
  
   # only draft, submitted or rejected dreams can be deleted by the user
   if (@dream.state < 3)
     @dream.destroy
   else
    flash[:error] = 'The dream could not be deleted.'   
   end  

    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :ok }
    end
  end



  def about
  end
end
