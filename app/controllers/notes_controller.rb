class NotesController < ApplicationController
  def index
    @sent_notes = Note.all(:conditions => {:sent => true})
    @unsent_notes = Note.all(:conditions => {:sent => false})
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      flash[:notice] = "Thank You Note successfully saved!"
      redirect_to note_url(@note)
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      flash[:notice] = "Thank You Note successfully saved!"
      redirect_to notes_url
    else
      render :new
    end
  end
end
