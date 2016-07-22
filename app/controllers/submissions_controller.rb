class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge, only: [:show, :edit, :update, :create]

  # GET /submissions
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  def create
    @submission = Submission.new(submission_params.merge(
      user: current_user,
      challenge: @challenge,
    ))

    if @submission.save
      redirect_to @challenge, notice: 'Your submission was sent and is queued to be checked'
    else
      render :new
    end
  end

  # PATCH/PUT /submissions/1
  def update
    if @submission.update(submission_params)
      if request.xhr?
        render :json => {success: true}
      else
        redirect_to @submission, notice: 'Submission was successfully updated.'
      end
    else
      if request.xhr?
        render :json => @submission.errors, :status => :unprocessable_entity
      else
        render :edit
      end
    end
  end

  # DELETE /submissions/1
  def destroy
    @submission.destroy
    redirect_to submissions_url, notice: 'Submission was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def set_challenge
      @challenge  = Challenge.find(params[:challenge_id])
    end

    # Only allow a trusted parameter "white list" through.
    def submission_params
      params.require(:submission).permit(:challenge_id, :user_id, :is_private, :approved_at, :denied_at, :url, :content, :points)
    end
end
