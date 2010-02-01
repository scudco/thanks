class Note
  include MongoMapper::Document

  key :address, String, :required => true
  key :body, String
  key :gift, String
  key :sent, Boolean

  def next_unsent
    Note.all.find do |note|
      !note.sent && note.id != self.id
    end
  end
end
