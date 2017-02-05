class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
=begin   userとnoteを関連づけたらコメントアウトを外す  
  before_action :correct_user, only: [:edit, :update] 
=end
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    file = params[:note][:image]
    if !file.nil?
      file_name = file.original_filename
      File.open("public/note_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      @note.image = file_name
    end

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: '投稿しました！' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: '更新しました！' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: '削除されました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:category, :content, :user_id)
    end
=begin   userとnoteを関連づけたらコメントアウトを外す
    def correct_user
      note = Note.find(params[:id])
      if !current_user?(note.user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end
=end

end
