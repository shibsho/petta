class CommentsController < ApplicationController


  def comment_params
    params.require(:comment).permit(:content)
  end
  def create

    note = Note.find(params[:id])
    comment = current_user.comments.build(note_id: note.id)
    comment = comment.update(comment_params)
    redirect_to note
  end

end
