#   Copyright (c) 2010-2012, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

class HomeController < ApplicationController
  def show
    if user_signed_in?
      redirect_to stream_path
    else
      redirect_to user_profile_path('ben')
    end
  end

  def toggle_mobile
    if session[:mobile_view].nil?
      # we're most probably not on mobile, but user wants it anyway
      session[:mobile_view] = true
    else
      # switch from mobile to normal html
      session[:mobile_view] = !session[:mobile_view]
    end

    redirect_to :back
  end
end
