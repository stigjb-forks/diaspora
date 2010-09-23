#   Copyright (c) 2010, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3.  See
#   the COPYRIGHT file.


class RequestsController < ApplicationController
  before_filter :authenticate_user!
  include RequestsHelper

  respond_to :html

  def destroy
    if params[:accept]
      if params[:aspect_id]
        @friend = current_user.accept_and_respond( params[:id], params[:aspect_id])
        flash[:notice] = I18n.t 'requests.destroy.success'
        respond_with :location => current_user.aspect_by_id(params[:aspect_id])
      else
        flash[:error] = I18n.t 'requests.destroy.error'
        respond_with :location => requests_url
      end
    else
      current_user.ignore_friend_request params[:id]
      flash[:notice] = I18n.t 'requests.destroy.ignore'
      respond_with :location => requests_url
    end
  end

  def new
    @request = Request.new
  end

  def create
    aspect = current_user.aspect_by_id(params[:request][:aspect_id])
    unless params[:request][:friend_handle]
      relationship_flow(
    else
      rel_hash = {:friend => params[:request][:friend_handle]}

    
    
    # begin
    #   rel_hash = relationship_flow(params[:request][:destination_url])
    # rescue Exception => e
    #   raise e unless e.message.include? "not found"
    #   flash[:error] = "No diaspora seed found with this email!"
    #   respond_with :location => aspect
    #   return
    # end
    puts "sending a request to " + rel_hash[:friend]
    # Rails.logger.debug("Sending request: #{rel_hash}")
    # 
    # begin
    #   @request = current_user.send_friend_request_to(rel_hash[:friend], aspect)
    # rescue Exception => e
    #   raise e unless e.message.include? "already friends"
    #   flash[:notice] = "You are already friends with #{params[:request][:destination_url]}!"
    #   respond_with :location => aspect
    #   return
    # end
    # 
    # if @request
    #   flash[:notice] =  "A friend request was sent to #{@request.destination_url}."
    #   respond_with :location => aspect
    # else
    #   flash[:error] = "Something went horribly wrong."
    #   respond_with :location => aspect
    # end
    
  end

end
