class GroupController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
end
