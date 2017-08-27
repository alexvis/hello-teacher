class CommentMailer < ApplicationMailer
  def new_comment(comment)
    @comment = comment
    current_user_id = @comment.user.id
    @email = []
    @comment.classroom.students.each do |student|
      student.classroom.students.each do |student|
        if student.tokens[1]
          student.tokens.each do |token|
            if token.user_id != current_user_id
              @email << token.user
            end
          end
        end
      end
    end

    mail(
    bcc: @email.map(&:email).uniq,
    subject: "New Message from Teacher To Class"
    )

  end
end
