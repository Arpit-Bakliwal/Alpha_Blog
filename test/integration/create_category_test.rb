require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "getting the new category form and create new category" do
    get "/categories/new"
    assert_response :success
    assert_difference "Category.count",1 do
      post categories_path, params: { category: { name: "Health" }}
      assert_response :redirect
    end

    follow_redirect!
    assert_response :success
    assert_match "Health", response.body
  end
end
