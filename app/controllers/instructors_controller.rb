class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.active
    @examiners = Examiner.active
    @users = User.admins

    respond_to do |format|
      format.html
    end
  end

  def help
    m = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @content = m.render(File.open(Rails.root + "README.md", 'r').read)
    # render :text => content
  end
end
