class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /challenges
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  def show
    # @challenge.includes(:submissions)
    @submissions = @challenge.submissions
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Request-Headers'] = 'accept, authorization, content-type'
    headers['Access-Control-Request-Method'] = 'POST'

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

    # Only allow a trusted parameter "white list" through.
    def challenge_params
      params.require(:challenge).permit(:description, :name, :is_locked, :category, :tag_list)
    end
end
