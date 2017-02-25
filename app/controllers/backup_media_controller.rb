class BackupMediaController < ApplicationController
  before_action :set_backup_medium, only: [:show, :edit, :update, :destroy]

  # GET /backup_media
  # GET /backup_media.json
  def index
    @backup_media = BackupMedium.all
  end

  # GET /backup_media/1
  # GET /backup_media/1.json
  def show
  end

  # GET /backup_media/new
  def new
    @backup_medium = BackupMedium.new
  end

  # GET /backup_media/1/edit
  def edit
  end

  # POST /backup_media
  # POST /backup_media.json
  def create
    @backup_medium = BackupMedium.new(backup_medium_params)

    respond_to do |format|
      if @backup_medium.save
        format.html { redirect_to @backup_medium, notice: 'Backup medium was successfully created.' }
        format.json { render :show, status: :created, location: @backup_medium }
      else
        format.html { render :new }
        format.json { render json: @backup_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backup_media/1
  # PATCH/PUT /backup_media/1.json
  def update
    respond_to do |format|
      if @backup_medium.update(backup_medium_params)
        format.html { redirect_to @backup_medium, notice: 'Backup medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @backup_medium }
      else
        format.html { render :edit }
        format.json { render json: @backup_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backup_media/1
  # DELETE /backup_media/1.json
  def destroy
    @backup_medium.destroy
    respond_to do |format|
      format.html { redirect_to backup_media_url, notice: 'Backup medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backup_medium
      @backup_medium = BackupMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backup_medium_params
      params.require(:backup_medium).permit(:name)
    end
end
