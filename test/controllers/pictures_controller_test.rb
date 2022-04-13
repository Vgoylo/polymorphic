# frozen_string_literal: true

require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  test 'should get crud' do
    get pictures_crud_url
    assert_response :success
  end
end
