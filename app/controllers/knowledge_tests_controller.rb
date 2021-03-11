class KnowledgeTestsController < ApplicationController
  # GET /knowledge_tests
  # GET /knowledge_tests.json
  def index
    @knowledge_tests = KnowledgeTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @knowledge_tests }
    end
  end

  # GET /knowledge_tests/1
  # GET /knowledge_tests/1.json
  def show
    @knowledge_test = KnowledgeTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @knowledge_test }
    end
  end

  # GET /knowledge_tests/new
  # GET /knowledge_tests/new.json
  def new
    @knowledge_test = KnowledgeTest.new
    3.times do
      test_question = @knowledge_test.test_questions.build
      4.times { test_question.test_answers.build }
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @knowledge_test }
    end
  end

  # GET /knowledge_tests/1/edit
  def edit
    @knowledge_test = KnowledgeTest.find(params[:id])
  end

  # POST /knowledge_tests
  # POST /knowledge_tests.json
  def create
    @knowledge_test = KnowledgeTest.new(params[:knowledge_test])

    respond_to do |format|
      if @knowledge_test.save
        format.html { redirect_to @knowledge_test, :notice => 'Knowledge test was successfully created.' }
        format.json { render :json => @knowledge_test, :status => :created, :location => @knowledge_test }
      else
        format.html { render :action => "new" }
        format.json { render :json => @knowledge_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knowledge_tests/1
  # PUT /knowledge_tests/1.json
  def update
    @knowledge_test = KnowledgeTest.find(params[:id])

    respond_to do |format|
      if @knowledge_test.update_attributes(params[:knowledge_test])
        format.html { redirect_to @knowledge_test, :notice => 'Knowledge test was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @knowledge_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_tests/1
  # DELETE /knowledge_tests/1.json
  def destroy
    @knowledge_test = KnowledgeTest.find(params[:id])
    @knowledge_test.destroy

    respond_to do |format|
      format.html { redirect_to knowledge_tests_url }
      format.json { head :ok }
    end
  end
end
