class ArchivesController < ApplicationController
  # GET /archives
  # GET /archives.json
  def index
    @archives = Archive.all
    
    @archiveID = params[:archiveID];
    if(@archiveID.nil? == false) 
       @archive = Archive.new(:archiveID =>@archiveID)
       respond_to do |format|
         if @archive.save
           format.html { redirect_to @archive, notice: 'Archive was successfully created.' }
           format.json { render json: @archive, status: :created, location: @archive }
         else
           format.html { render action: "new" }
           format.json { render json: @archive.errors, status: :unprocessable_entity }
         end
       end
   else
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @archives }
    end
  end
  end

  # GET /archives/1
  # GET /archives/1.json
  def show
    @archive = Archive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @archive }
    end
  end
  
   # GET /archives/last.json
   def show
     @archive = Archive.find(:last)

     respond_to do |format|
       format.json { render json: @archive }
     end
   end

  # GET /archives/new
  # GET /archives/new.json
  def new
    @archive = Archive.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @archive }
    end
  end

  # GET /archives/1/edit
  def edit
    @archive = Archive.find(params[:id])
  end

  # POST /archives
  # POST /archives.json
  def create
    @archive = Archive.new(params[:archive])

    respond_to do |format|
      if @archive.save
        format.html { redirect_to @archive, notice: 'Archive was successfully created.' }
        format.json { render json: @archive, status: :created, location: @archive }
      else
        format.html { render action: "new" }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /archives/1
  # PUT /archives/1.json
  def update
    @archive = Archive.find(params[:id])

    respond_to do |format|
      if @archive.update_attributes(params[:archive])
        format.html { redirect_to @archive, notice: 'Archive was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.json
  def destroy
    @archive = Archive.find(params[:id])
    @archive.destroy

    respond_to do |format|
      format.html { redirect_to archives_url }
      format.json { head :ok }
    end
  end
end
