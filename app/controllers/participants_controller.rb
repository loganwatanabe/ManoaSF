class ParticipantsController < ApplicationController
  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.alphabetical
    @children = Participant.children.alphabetical.paginate(:page => params[:page]).per_page(20)
    @juniors = Participant.juniors.alphabetical.paginate(:page => params[:page]).per_page(20)

  end

  def children
    @children = Participant.children.alphabetical.paginate(:page => params[:page]).per_page(20)
  end

  def junior_leaders
    @juniors = Participant.juniors.alphabetical.paginate(:page => params[:page]).per_page(20)
  end   

  # GET /participants/1
  # GET /participants/1.json
  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participant }
    end
  end

  # GET /participants/new
  # GET /participants/new.json
  def new
    @participant = Participant.new
    @groups = Group.alphabetical
    @meals = Meal.chronological.alphabetical

    @participant.contacts.build
    @participant.absences.build
    @participant.build_yummy_tummy_day_order
  end

  # GET /participants/1/edit
  def edit
    @participant = Participant.find(params[:id])
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(params[:participant])

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render json: @participant, status: :created, location: @participant }
      else
        format.html { render action: "new" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /participants/1
  # PUT /participants/1.json
  def update
    @participant = Participant.find(params[:id])

    respond_to do |format|
      if @participant.update_attributes(params[:participant])
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end
end
