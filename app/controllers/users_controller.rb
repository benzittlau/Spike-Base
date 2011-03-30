class UsersController < ApplicationController
  before_filter :get_user, :only => [:show, :audit]
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def audit
    @user.revert_to(params[:version].to_i)
    
    if @user.live?
      redirect_to @user
    end
    
    revert_link = view_context.link_to("Revert to this version", user_revert_path(@user, :version => params[:version]))
    flash.now[:notice] = "You are viewing an old version of this object. #{revert_link}".html_safe
  end
  
  def revert
    @user = User.find(params[:id])
    
    #assign the versioning responsibility
    @user.updated_by = current_user
    
    @user.revert_to!(params[:version].to_i)
    redirect_to user_path(@user)
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    #assign the versioning responsibility
    @user.updated_by = current_user

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    
    #assign the versioning responsibility
    @user.updated_by = current_user
    #params[:user].merge!({:updated_by => current_user})

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    
    #assign the versioning responsibility
    @user.updated_by = current_user
    
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
    def get_user
      @user = User.find_by_id(params[:id]) || UserVersion.deleted(params[:id], User).restore
      
      @versions = @user.versions.scoped.reverse
    end
end
