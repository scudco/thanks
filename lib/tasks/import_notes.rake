require 'faster_csv'

desc "Import CSV Notes from notes.csv"
task :import_notes => :environment do
  notes = []
  FCSV.foreach('notes.csv') do |row|
    Note.create(:address => "#{row[2]} #{row[3]}  \n#{row[4]}  \n#{row[5]}",
                :gift => row[1],
                :sent => (row[0].to_s == 'Y' ? true : false),
                :body => "")
  end
end
