class ApplicationController < ActionController::Base
  before_action :set_navbar_items

  private

  def set_navbar_items
    @navbar_items = [
      {
        title: 'Words',
        path: words_path
      }
    ]
  end
end
