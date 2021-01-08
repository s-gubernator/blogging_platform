# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_after_action :verify_authorized

  def home; end
end
