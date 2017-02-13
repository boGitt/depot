require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    # the test data is in the file 'fixtures/products.yml'
    assert_select '#columns #side a', :mininum => 4
    assert_select '#main .entry', 3
    assert_select 'span', {:count=>1, :text=>"$0.90"}
    assert_select 'h3', 'myRuby'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end

