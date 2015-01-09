class TestAnswersController < ApplicationController
  # GET /test_answers
  # GET /test_answers.json
  def index
    @test_answers = TestAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @test_answers }
    end
  end

  # GET /test_answers/1
  # GET /test_answers/1.json
  def show
    @test_answer = TestAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @test_answer }
    end
  end

  # GET /test_answers/new
  # GET /test_answers/new.json
  def new
    @test_answer = TestAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @test_answer }
    end
  end

  # GET /test_answers/1/edit
  def edit
    @test_answer = TestAnswer.find(params[:id])
  end

  # POST /test_answers
  # POST /test_answers.json
  def create
    @test_answer = TestAnswer.new(params[:test_answer])

    respond_to do |format|
      if @test_answer.save
        format.html { redirect_to @test_answer, :notice => 'Test answer was successfully created.' }
        format.json { render :json => @test_answer, :status => :created, :location => @test_answer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @test_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_answers/1
  # PUT /test_answers/1.json
  def update
    @test_answer = TestAnswer.find(params[:id])

    respond_to do |format|
      if @test_answer.update_attributes(params[:test_answer])
        format.html { redirect_to @test_answer, :notice => 'Test answer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @test_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_answers/1
  # DELETE /test_answers/1.json
  def destroy
    @test_answer = TestAnswer.find(params[:id])
    @test_answer.destroy

    respond_to do |format|
      format.html { redirect_to test_answers_url }
      format.json { head :ok }
    end
  end
end
