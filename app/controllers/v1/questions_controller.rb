class V1::QuestionsController < ApiController
  def index
    questions = Question.all.page(params[:page]).per(params[:per_page])
    render json: questions
  end

  def show
    question = Question.find(params[:id])
    render json: question
  end

  def create
    question = Question.new(question_params)
    if question.save
      render json: question
    else
      render_error_message(status: :unprocessable_entity, message: question.errors.messages)
    end
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      render json: question
    else
      render_error_message(status: :unprocessable_entity, message: question.errors.messages)
    end
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def question_params
    params.permit(:content)
  end
end
