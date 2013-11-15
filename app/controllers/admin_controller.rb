class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def index
    @states = Dream.states
    @num_users = User.all.count
    @num_users_active30days = User.where('last_sign_in_at > ?', 30.days.ago).count
    @num_users_created30days = User.where('created_at > ?', 30.days.ago).count
  end
  
  def dreams
    if params[:state]    
      @state = params[:state]
      if !['0', '1', '2', '3', '4'].index(@state)
        @state = '1'
      end
    else
      @state = '1'
    end  
  
    case @state
      when '0' then @state_name = 'private'; @order = 'updated_at desc'
      when '1' then @state_name = 'submitted'; @order = 'updated_at desc'
      when '2' then @state_name = 'rejected'; @order = 'updated_at desc'
      when '3' then @state_name = 'accepted'; @order = 'accepted desc'
      when '4' then @state_name = 'featured'; @order = 'accepted desc'
    end
    @dreams = Dream.where(:state => @state).order(@order)      
  end
  
  def accept
    @dream = Dream.find(params[:id])
  
    if @dream.state == 1
      @dream.state = 3
      flash[:notice] = 'The dream has been accepted.'
      if params[:value]
        if params[:value] == '1'
          @dream.state = 4
          flash[:notice] = 'The dream has been accepted as a featured dream'
        end  
      end      
  
      @dream.freezebody = [@dream.title, @dream.teaser, @dream.body, @dream.version, @dream.changelog].compact.join("\n\n")
      @dream.accepted = Time.now 
  
      if !@dream.save
        flash[:notice] = 'There was an error while accepting the dream.'
      end
    else
      flash[:notice] = 'Only submitted dreams can be published.'
    end
    redirect_to :action => 'dreams', :state => 1
  end    
        
  def editreject
     @dream = Dream.find(params[:id])
     if @dream.state != 1
       flash[:notice] = 'Only submitted dreams can be rejected.'
       redirect_to :action => 'dreams', :state => 1 
     end
  end
  
  def reject
    @dream = Dream.find(params[:id])
  
    if @dream.state == 1
      if params[:dream][:message]
        @dream.state = 2
        @dream.message = params[:dream][:message] 
        @dream.freezebody = [@dream.title, @dream.teaser, @dream.body, @dream.version, @dream.changelog].compact.join("\n\n")
    
        if @dream.save
          flash[:notice] = "The artile was rejected."
          redirect_to :action => 'dreams', :state => 1
        else
          render :action => "editreject"
        end  
      else
        flash[:notice] = "No reject without reject message."
        redirect_to :action => 'dreams', :state => 1
      end
    else
      flash[:notice] = "Only submitted dreams can be rejected."
      redirect_to :action => 'dreams', :state => 1
    end  
  end

  protected
  def is_admin
    if current_user
      if current_user.id == 1
        return 1
      end
    end
    redirect_to root_url
  end 
end
