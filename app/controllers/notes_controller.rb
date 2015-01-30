class NotesController < ApplicationController
  def index
    @notes = Note.all
    render json: @notes
    # or you just need:
    # render json: Note.all
  end

  def create
    # at.note = Note.create(params.require(:note).permit(:title, :body))
    note_params = params.require(:note).permit(:title, :body)
    @note = Note.new(note_params)
    @note.save
    render json: @note
  end

  def show
    @note = Note.find(params[:id])
    render json: @note
  end

  def update
    note_params = params.require(:note).permit(:title, :body)
    @note = Note.find(params[:id])
    @note.update(note_params)
    render json: @note
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: @note
  end

end
