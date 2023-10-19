class GroupController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.where(author_id: current_user.id)
  end
end
