require 'spec/spec_helper'

describe NotesController do
  context "GET #index" do
    it "finds all the notes" do
      sent_notes = []
      unsent_notes = []
      5.times do
        sent_notes << Factory(:note, :sent => true)
        unsent_notes << Factory(:note, :sent => false)
      end

      get :index

      assigns[:sent_notes].should == sent_notes
      assigns[:unsent_notes].should == unsent_notes
    end
  end

  context "GET #new" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should setup a new Note" do
      get :new
      assigns[:note].should be_new_record
    end
  end

  context "POST #create" do
    it "should save a new note successfully" do
      note = {
        :address => 'John and Jane\n123 Fake St.\nFuntown, CA 99999',
        :gift => 'French Fry Machine',
        :body => 'Thanks, guys!',
        :sent => false
      }
      post :create, :note => note
      assigns[:note].should_not be_new_record
    end
  end

  context "GET #show" do
    it "should find the requested note" do
      @note = Factory(:note)
      get :show, :id => @note.id
      assigns[:note].should == @note
    end
  end
end
