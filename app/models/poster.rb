# == Schema Information
#
# Table name: posters
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  length                  :integer
#  width                   :integer
#  special_request         :text
#  job_id                  :integer
#  poster_status_id        :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

class Poster < ActiveRecord::Base
  attr_accessible :job_id, :length, :name, :poster_status_id, :special_request, :width, :attachment, :denial, :mounting
  belongs_to :job
  belongs_to :poster_status
  validates :length, numericality: { greater_than_or_equal_to: 20, less_than_or_equal_to: 40 }

  has_attached_file :attachment
  validates_attachment_presence :attachment
  validates_attachment :attachment, content_type: { content_type: "application/pdf" }, message: "Attachment must be a .pdf"
  #validate :check_content_type
  # do_not_validate_attachment_file_type :image
  has_paper_trail

  def check_content_type
    if !"application/pdf".include?(self.attachment_content_type)
      errors.add_to_base("Attachment must be a .pdf")
    end
  end
  def set_printing
    self.poster_status = PosterStatus.where(name: "Printing").first
  end
  def set_pending
    self.poster_status = PosterStatus.where(name: "Pending").first
  end
  def set_finished
    self.poster_status = PosterStatus.where(name: "Finished").first
  end
  def set_denied
    self.poster_status = PosterStatus.where(name: "Denied").first
  end
end
