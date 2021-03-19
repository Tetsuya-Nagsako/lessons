module LessonsHelper
  def lesson_error_messages!
    return "" if @lesson.errors.empty?
    html = ""
    @lesson.errors.full_messages.each do |error_message|
      html += <<-EOF
      <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert">
          <span aria-hidden="true">&times;</span>
          <span class="sr-only">close</span>
        </button>
        #{error_message}
      </div>
      EOF
    end
    html.html_safe
  end
  
  def buyable_with_sales?
    if !@lesson.bought_user && current_user.sales >= @lesson.price && @lesson.user_id != current_user.id
      return true
    end
  end
  
  
  def commentable_user?
    if @lesson.user_id == current_user.id || @lesson.bought_user == current_user.id
      return true
    end
  end
  
end
