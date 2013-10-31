class LibraryController < ApplicationController
  def index
    @briefings = FlightBriefing.all
  end

  def p2_presentation
  end

  def p1_presentation
  end

  def p4_presentation
  end
end
