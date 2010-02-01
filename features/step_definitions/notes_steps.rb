Given /^I have created (\d+) Thank You Notes?$/ do |number_of_notes|
  @notes = []
  number_of_notes.to_i.times { @notes << Factory(:note) }
  @note = @notes.first
end

Given /^I visit that note's page$/ do
  visit note_path(@note)
end

Given /^I visit the first note's page$/ do
  visit note_path(Note.first)
end

Given /^I visit the second note's page$/ do
  visit note_path(Note.all[1])
end

Given /^I have created (\d+) Sent Thank You Notes?$/ do |number_of_notes|
  @notes = []
  number_of_notes.to_i.times { @notes << Factory(:note, :sent => true) }
  @note = @notes.first
end

Given /^I have created (\d+) Unsent Thank You Notes?$/ do |number_of_notes|
  @notes = []
  number_of_notes.to_i.times { @notes << Factory(:note, :sent => false) }
  @note = @notes.first
end


Then /^I should see (\d+) notes$/ do |number_of_notes|
  response.should have_tag('.note', 5)
end

Then /^I should see (\d+) sent notes?$/ do |number_of_notes|
  response.should have_tag('.note.sent', number_of_notes.to_i)
end

Then /^I should see (\d+) unsent notes?$/ do |number_of_notes|
  response.should have_tag('.note.unsent', number_of_notes.to_i)
end

Then /^I should see the Thank You Note$/ do
  response.should have_tag("#note_#{@note.id}") do
    with_tag '.address', @note.address
    with_tag '.gift', @note.gift
    with_tag '.body', @note.body
    with_tag '.sent', "Not yet sent"
  end
end
