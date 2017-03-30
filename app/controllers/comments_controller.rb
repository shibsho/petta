class CommentsController < ApplicationController

  def create

    note = Note.find(params[:id])
    comment = current_user.comments.build(note_id: note.id)
    comment.content = params[:comment][:content]
    comment.save
    if comment.save
      redirect_to note, notice: 'コメントを投稿しました！'
    else
      redirect_to note, notice: 'コメントを入力してください。'
    end
  end

end
