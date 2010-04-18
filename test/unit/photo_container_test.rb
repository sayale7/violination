require 'test_helper'

class PhotoContainerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PhotoContainer.new.valid?
  end
end
