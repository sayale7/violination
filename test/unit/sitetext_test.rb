require 'test_helper'

class SitetextTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sitetext.new.valid?
  end
end
