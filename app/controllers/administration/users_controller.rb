# frozen_string_literal: true

module Administration
  class UsersController < ApplicationController
    before_action :set_administration_user, only: %i[show edit update destroy]

    # GET /administration/users
    # GET /administration/users.json
    def index
      @administration_users = User.all
    end

    # GET /administration/users/1
    # GET /administration/users/1.json
    def show; end

    # GET /administration/users/new
    def new
      @administration_user = User.new
    end

    # GET /administration/users/1/edit
    def edit; end

    # POST /administration/users
    # POST /administration/users.json
    def create
      @administration_user = User.new(administration_user_params)

      respond_to do |format|
        if @administration_user.save
          format.html { redirect_to @administration_user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @administration_user }
        else
          format.html { render :new }
          format.json { render json: @administration_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /administration/users/1
    # PATCH/PUT /administration/users/1.json
    def update
      respond_to do |format|
        if @administration_user.update(administration_user_params)
          format.html { redirect_to @administration_user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @administration_user }
        else
          format.html { render :edit }
          format.json { render json: @administration_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /administration/users/1
    # DELETE /administration/users/1.json
    def destroy
      @administration_user.destroy
      respond_to do |format|
        format.html { redirect_to administration_users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_administration_user
      @administration_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administration_user_params
      params.fetch(:administration_user, {})
    end
  end
end
