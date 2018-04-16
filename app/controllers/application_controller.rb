class ApplicationController < ActionController::Base
  before_action :set_navbar_items

  private

  def set_navbar_items
    @navbar_items = [
      {
        title: 'Training',
        path: trainer_index_path
      }
    ]
  end
end
