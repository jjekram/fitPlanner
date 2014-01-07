require 'json'
class StaticPagesController < ApplicationController
  before_filter :logged_in_user_notice, only: [:about]
  before_filter :logged_in_user, only: [:home]

  def about
  	
  end


  def home

    # days of the week
    days =["Monday", "Tuesday", "Wednesday", "Thursday", "Friday","Saturday","Sunday"]

    @routines = []

    @todays_routines = []

    @today = ""

    @tomorrow = ""

    @tomorrows_routines = []

    @monday_routines = []

    @tuesday_routines = []

    @wednesday_routines = []

    @thursday_routines = []

    @friday_routines = []

    @saturday_routines = []

    @sunday_routines = []


    # get all the routines
    current_user.routines.each do |routine|
      @routines << routine

      #days the routine is performed
      routine_days = routine.days.split(", ")

      routine_days.each do |day|

        today_index = Date.today.wday

        # if the routine is for today
        if days[today_index-1] == day
          @todays_routines << routine

        # if today is sunday and the routine is for Monday
        elsif today_index == 7 &&  days[0] == day
          @tomorrows_routines << routine

        # if today is not sunday and the routine is for tomorrow
        elsif today_index != 7 && days[today_index] == day
          @tomorrows_routines << routine

        end

        # parsing routine based on day it belongs to
        if day == "Monday"
          @monday_routines << routine

        elsif day == "Tuesday"
          @tuesday_routines << routine

        elsif day == "Wednesday"
          @wednesday_routines << routine

        elsif day == "Thursday"
          @thursday_routines << routine

        elsif day == "Friday"
          @friday_routines << routine

        elsif day == "Saturday"
          @saturday_routines << routine

        else
          @sunday_routines << routine
          
        end



      end

    end
    

  end


  private
    def logged_in_user_notice
        redirect_to login_path, notice: "Please log in." unless logged_in?
    end

    def logged_in_user
        redirect_to login_path unless logged_in?
    end
end
