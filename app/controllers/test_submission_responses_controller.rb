class TestSubmissionResponsesController < ApplicationController

skip_before_filter :check_authorization, :check_authentication

  # GET /test_submission_responses
  # GET /test_submission_responses.json
  def index
    @test_submission_responses = TestSubmissionResponse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @test_submission_responses }
    end
  end

  # GET /test_submission_responses/1
  # GET /test_submission_responses/1.json
  def show
    @test_submission_response = TestSubmissionResponse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @test_submission_response }
    end
  end

  # GET /test_submission_responses/new
  # GET /test_submission_responses/new.json
  def new
    @test_submission_response = TestSubmissionResponse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @test_submission_response }
    end
  end

  # GET /test_submission_responses/1/edit
  def edit
    @test_submission_response = TestSubmissionResponse.find(params[:id])
  end

  # POST /test_submission_responses
  # POST /test_submission_responses.json
  def create
    @test_submission_response = TestSubmissionResponse.new(params[:test_submission_response])

    respond_to do |format|
      if @test_submission_response.save
        format.html { redirect_to @test_submission_response, :notice => 'Test submission response was successfully created.' }
        format.json { render :json => @test_submission_response, :status => :created, :location => @test_submission_response }
      else
        format.html { render :action => "new" }
        format.json { render :json => @test_submission_response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_submission_responses/1
  # PUT /test_submission_responses/1.json
  def update
    @test_submission_response = TestSubmissionResponse.find(params[:id])

    respond_to do |format|
      if @test_submission_response.update_attributes(params[:test_submission_response])
        format.html { redirect_to @test_submission_response, :notice => 'Test submission response was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @test_submission_response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_submission_responses/1
  # DELETE /test_submission_responses/1.json
  def destroy
    @test_submission_response = TestSubmissionResponse.find(params[:id])
    @test_submission_response.destroy

    respond_to do |format|
      format.html { redirect_to test_submission_responses_url }
      format.json { head :ok }
    end
  end
end
