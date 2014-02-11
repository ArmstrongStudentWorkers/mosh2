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

require 'test_helper'

class PosterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
