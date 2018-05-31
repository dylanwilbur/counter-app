require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  
  def setup
    @story = Story.new(name: "Anne Frank", content: "Lorem Ipsum")
  end
  
  test "should be valid" do
    assert @story.valid?
    @story.img = "https://www.placehold.it/400x200"
    assert @story.valid?
  end
  
  test "content should be present" do
    @story.content = nil
    assert_not @story.valid?
  end
  
  test "name should be present" do
    @story.name = nil
    assert_not @story.valid?
  end
  
  test "name should be at most 50 characters" do
    @story.name = "a" * 51
    assert_not @story.valid?
  end
end
