class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]
  before_action :user_confirm, only: %i[ edit update destroy ]

  def index
    @lessons = Lesson.all
    @lessons = @lessons.order("time_information DESC")
  end

  def user_index
    @lessons = current_user.lessons
    @lessons = @lessons.order("time_information DESC")
  end

  def show
    @user = User.find(@lesson.user_id)
  end

  def new
    @lesson = Lesson.new
  end

  def edit
  end

  def create
    @lesson = current_user.lessons.new(lesson_params)
      if @lesson.save
        redirect_to @lesson, flash: {success: "Lesson投稿が完了しました" }
      else
        render :new, status: :unprocessable_entity 
      end
  end

  def update
      if @lesson.update(lesson_params)
        redirect_to @lesson, notice: "Lessonの編集が完了しました" 
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    if @lesson.status.blank? || @lesson.status == 3
      @lesson.destroy
      redirect_to lessons_url, notice: "Lessonの削除が完了しました"
    else
      redirect_to root_path, flash: {danger: '受講完了を受けていないので、削除できません'}
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end
    
    def user_confirm
      unless current_user.id == @lesson.user_id
        redirect_to root_path
      end
    end

    def lesson_params
      params.require(:lesson).permit(:user_id, :description, :image, :time_information, :price, :title)
    end
end
