class PtdMailer < ActionMailer::Base
  default from: "no-reply@vateud.net"


  def welcome_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "Welcome to VATEUD training program")
  end

  def welcome_mail_users(pilot)
    @pilot = pilot
    mail(:to => User.email_recipients, :subject => "New pilot enrolled in the VATEUD PTD program")
  end

  def instructor_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Instructor assigned")
  end

  def instructor_mail_instructor(pilot)
    @pilot = pilot
    mail(:to => @pilot.instructor.email, :subject => "VATEUD PTD trainee assigned")
  end

  def examination_mail_pilots(examination)
    @examination = examination
    pilot_emails = []
    @examination.pilots.each {|pilot| pilot_emails << pilot.email }
    @pilot_names = []
    @examination.pilots.each {|pilot| @pilot_names << pilot.name }
    mail(:to => pilot_emails, :subject => "VATEUD PTD Examination Scheduled")
  end  

  def examination_mail_instructors(examination)
    @examination = examination
    instructor_emails = []
    @examination.pilots.each {|pilot| instructor_emails << pilot.instructor.email if pilot.instructor }
    @pilot_names = []
    @examination.pilots.each {|pilot| @pilot_names << pilot.name }
    if instructor_emails.count > 0
      mail(:to => instructor_emails, :subject => "VATEUD PTD Examination Scheduled for your trainee")
    end
  end  

  def examination_mail_examiner(examination)
    @examination = examination    
    @pilot_names = []
    @examination.pilots.each {|pilot| @pilot_names << pilot.name }
    mail(:to => @examination.examiner.email, :subject => "VATEUD PTD Examination Scheduled")
  end 

  def token_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Exam Token Issued")
  end 

  def theory_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Theoretical Exam Passed")
  end

  def theory_mail_instructor(pilot)
    @pilot = pilot
    if pilot.instructor
      mail(:to => @pilot.instructor.email, :subject => "VATEUD PTD Theoretical Exam Passed by your trainee")
    end
  end

  def practical_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Practical Exam Passed")
  end

  def practical_mail_instructor(pilot)
    @pilot = pilot
    if pilot.instructor
      mail(:to => @pilot.instructor.email, :subject => "VATEUD PTD Practical Exam Passed by your trainee")
    end
  end

  def upgraded_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Pilot Rating Upgrade")
  end 
end


