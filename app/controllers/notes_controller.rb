class NotesController < ApplicationController
  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    note_params = params.require(:note).permit(:title, :body)
    @note = Note.new(note_params)
    @note.save
    render json: {note: @note}
  end

  def show
    @note = Note.find(params[:id])
    render json: {note: @note}
  end

  def update
    note_params = params.require(:note).permit(:title, :body)
    @note = Note.find(params[:id])
    @note.update(note_params)
    render json: {note: @note}
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: {note: @note}
  end

end
