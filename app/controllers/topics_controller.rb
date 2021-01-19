# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit update destroy]

  def index
    authorize Topic
    @topics = Topic.all.page(params[:page])
  end

  def show
    authorize @topic
  end

  def new
    authorize Topic
    @topic = Topic.new
  end

  def create
    authorize Topic
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topic_url(@topic), notice: 'Topic was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @topic
  end

  def update
    authorize @topic
    if @topic.update(topic_params)
      redirect_to topic_url(@topic), notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @topic
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name)
  end
end
