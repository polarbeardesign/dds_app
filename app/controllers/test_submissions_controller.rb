class TestSubmissionsController < ApplicationController
  # GET /test_submissions
  # GET /test_submissions.json

skip_before_filter :check_authorization, :check_authentication

  def index
    @test_submissions = TestSubmission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @test_submissions }
    end
  end

  # GET /test_submissions/1
  # GET /test_submissions/1.json
  def show
    @test_submission = TestSubmission.find(params[:id])
     render :layout => "homepage"

#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @test_submission }
#    end
  end

  # GET /test_submissions/new
  # GET /test_submissions/new.json
  def new
    @test_submission = TestSubmission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @test_submission }
    end
  end

  # GET /test_submissions/1/edit
  def edit
    @test_submission = TestSubmission.find(params[:id])
  end

  # POST /test_submissions
  # POST /test_submissions.json
  def create
    @test_submission = TestSubmission.new(params[:test_submission])

    respond_to do |format|
      if @test_submission.save
        format.html { redirect_to(@test_submission, :notice => 'If you would like to make changes use your back button.') }
        format.xml  { render :xml => @test_submission, :status => :created, :location => @test_submission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_submissions/1
  # PUT /test_submissions/1.json
  def update
    @test_submission = TestSubmission.find(params[:id])

    respond_to do |format|
      if @test_submission.update_attributes(params[:test_submission])
        format.html { redirect_to @test_submission, :notice => 'Test submission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @test_submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_submissions/1
  # DELETE /test_submissions/1.json
  def destroy
    @test_submission = TestSubmission.find(params[:id])
    @test_submission.destroy

    respond_to do |format|
      format.html { redirect_to test_submissions_url }
      format.json { head :ok }
    end
  end


  def knowledge_exam
     @test_submission = TestSubmission.new


    @knowledge_test = KnowledgeTest.find(params[:knowledge_test])
    @test_submission_responses = @test_submission.test_submission_responses.build
     render :layout => "homepage"


#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @test_submission }
#    end
  end
end