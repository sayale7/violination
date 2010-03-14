require 'test_helper'

class TagNameTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TagName.new.valid?
  end
end
