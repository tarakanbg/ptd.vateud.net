class LibraryController < ApplicationController
  def index
    @briefings = FlightBriefing.all
  end

  def p2_presentation
    @doc = Option.find_by_name("p2_embed_link").value
  end

  def p1_presentation
    @doc = Option.find_by_name("p1_embed_link").value
  end

  def p4_presentation
    @doc = Option.find_by_name("p4_embed_link").value
  end

  def handy_sheet
    @doc = Option.find_by_name("hs_embed_link").value
  end
end
