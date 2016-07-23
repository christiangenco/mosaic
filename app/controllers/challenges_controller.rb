class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:edit, :update, :destroy]
  before_action :set_challenge_with_submissions, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_admin!, except: [:index, :show, :new, :create]
  # before_action :authenticate_user!

  # GET /challenges
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  def show
    # # @challenge.includes(:submissions)
    # @submissions = @challenge.submissions
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  def create
    @challenge = Challenge.new(challenge_params)

    if @challenge.save
      redirect_to @challenge, notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /challenges/1
  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: 'Challenge was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /challenges/1
  def destroy
    @challenge.destroy
    redirect_to challenges_url, notice: 'Challenge was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def set_challenge_with_submissions
      @challenge = Challenge.includes(:submissions).find(params[:id])
      @submissions = @challenge.submissions.order(cached_votes_for: :desc)
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_params
      params.require(:challenge).permit(:description, :name, :is_locked, :category, :tag_list, :points)
    end
end
