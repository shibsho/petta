class CommentController < ApplicationController

  def new
    note = Note.find(params[:note_id])
    comment = current_user.comments.build(note_id: note.id)
    comment.content = params[:content]
    comment.save
    redirect_to note
  end

end
