class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]
  before_action :user_confirm, only: %i[ edit update destroy ]

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.all
    @lessons = @lessons.order("time_information DESC")
  end

  def user_index
    @lessons = current_user.lessons
  end


  # GET /lessons/1 or /lessons/1.json
  def show
    @user = User.find(@lesson.user_id)
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = current_user.lessons.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, flash: {success: "Lesson投稿が完了しました" }}
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: "Lessonの編集が完了しました" }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lessonの削除が完了しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end
    
    def user_confirm
      unless current_user.id == @lesson.user_id
        redirect_to root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:user_id, :description, :image, :time_information, :price, :title)
    end
end
