require 'test_helper'

class TwitterListTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert TwitterList.new.valid?
  end
end
