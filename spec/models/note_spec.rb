require 'spec/spec_helper'

describe Note do
  describe "#next_unsent" do
    it "finds the next unsent note" do
      note = Factory(:note)
      second_note = Factory(:note, :sent => false)
      note.next_unsent.should == second_note
    end
  end
end
