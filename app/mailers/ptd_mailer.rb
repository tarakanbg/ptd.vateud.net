class PtdMailer < ActionMailer::Base
  default from: "no-reply@vateud.net"


  def welcome_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "Welcome to VATEUD training program")
  end

  def welcome_mail_users(pilot)
    @pilot = pilot
    mail(:to => User.admin_email_recipients, :subject => "New pilot enrolled in the VATEUD PTD program")
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

  def practical_mail_admin(pilot)
    @pilot = pilot    
    mail(:to => User.certified_emails, :subject => "VATEUD PTD Pilot Waiting for Upgrade")
  end

  def upgraded_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Pilot Rating Upgrade")
  end 

  def feedback_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Examination Feedback received")
  end 

  def feedback_mail_instructor(pilot)
    @pilot = pilot
    if pilot.instructor
      mail(:to => @pilot.instructor.email, :subject => "VATEUD PTD Examination feedback for your trainee")
    end
  end

  def training_mail_pilots(training)
    @training = training
    pilot_emails = []
    @training.pilots.each {|pilot| pilot_emails << pilot.email }
    @pilot_names = []
    @training.pilots.each {|pilot| @pilot_names << pilot.name }
    mail(:to => pilot_emails, :subject => "VATEUD PTD Training Session Scheduled")
  end  

  def training_mail_instructor(training)
    @training = training    
    @pilot_names = []
    @training.pilots.each {|pilot| @pilot_names << pilot.name }
    mail(:to => @training.instructor.email, :subject => "VATEUD PTD Training Session Scheduled")
  end 

  def ready_for_practical_mail_examiners(pilot)
    @pilot = pilot
    mail(:to => User.examiner_email_recipients, :subject => "VATEUD PTD Pilot Ready for Examination")
  end 

  def theory_fail_mail_instructors(pilot)
    @pilot = pilot
    mail(:to => User.instructor_email_recipients, :subject => "VATEUD PTD Pilot Failed Theory Test")
  end

  def practical_fail_mail_instructors(pilot)
    @pilot = pilot
    mail(:to => User.instructor_email_recipients, :subject => "VATEUD PTD Pilot Failed Practical Exam")
  end

  def theory_fail_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Theory Test Failed")
  end

  def practical_fail_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Practical Examination Failed")
  end

  def ready_for_practical_mail_pilot(pilot)
    @pilot = pilot
    mail(:to => @pilot.email, :subject => "VATEUD PTD Ready for Practical Examination")
  end

  def examination_join_mail_pilot(pilot, examination_id)
    @pilot = pilot
    @examination = Examination.find(examination_id)
    mail(:to => @pilot.email, :subject => "VATEUD PTD Examination Joined")
  end

  def examination_join_mail_examiner(pilot, examination_id)
    @pilot = pilot
    @examination = Examination.find(examination_id)
    mail(:to => @examination.examiner.email, :subject => "VATEUD PTD Pilot Joined Your Examination")
  end

  def training_join_mail_pilot(pilot, training)
    @pilot = pilot
    @training = training
    mail(:to => @pilot.email, :subject => "VATEUD PTD Training Joined")
  end

  def training_join_mail_instructor(pilot, training)
    @pilot = pilot
    @training = training
    mail(:to => @training.instructor.email, :subject => "VATEUD PTD Pilot Joined Your Training")
  end

end
