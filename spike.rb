module Runnable
  def run
  end
end

class Player
  include Runnable
  def initialize(color = "blue")
    @jersey_color = color
  end

  def shoot
  end
end

class Attacker < Player
  def lob
  end
end

class Midfielder < Player
  def pass
  end
end

class Defender < Player
  def block
  end
end


class Goalkeeper
  include Runnable
  def initialize(color)
    super(color)
  end
end

class Referee
  include Runnable
  def initialize
    @shirt = "black"
  end
  def whistle
  end
end







=begin
Inside a preschool there are children, teachers, class assistants, 
a principle, janitors, and cafeteria workers. 

Both teachers and assistants can help a student with schoolwork and watch them on 
the playground. 

A teacher teaches and an 

A assistant helps kids with 
any bathroom emergencies. 

Kids themselves can learn and play. 

A teacher and principle can supervise a class. 

Only the principle has the ability to expel a kid. 

Janitors have the ability to clean. 

Cafeteria workers have the ability to serve food. 

Children, teachers, class assistants, 
principles, janitors and cafeteria workers all have the ability to eat lunch.


Verbs: help, watch

Children
- learn
- play
- eat lunch

Teacher
- teaches
- help with schoolwork
- watch kids on playground
- supervise class
- eat lunch

Class Assistants
- help with schoolwork
- watch kids on playground
- help with bathroom emergeniecs
- eat lunch

Principle
- supervise class
- expel kid
- eat lunch

Janitors
- clean
- eat lunch

Cafeteria Workers
- server food
- eat lunch

=end

module Lunchable
  def eat
    "Let's eat some lunch."
  end
end

module Supervisable
  def supervise
    "supervise kids"
  end
end

module Assistable
  def help_with_schoolwork
    "help with school work"
  end

  def watch_kids
    "watch kids"
  end
end

class Children
  include Lunchable

  def learn
    "learn stuff"
  end

  def play
    "play games"
  end
end

class Teacher
  include Lunchable
  include Supervisable
  include Assistable

  def teacher
    "teach things"
  end
end

class ClassAssistants
  include Lunchable
  include Assistable

  def help_with_bathroom_emergencies
    "potty problems"
  end
end

class Principle
  include Lunchable
  include Supervisable

  def expel
    "you are expelled kid"
  end
end


class Janitors
  include Lunchable
  
  def clean
    "clean stuff"
  end
end


class CafeteriaWorkers
  include Lunchable
  
  def serve_food
    "server some food"
  end
end





=begin
There's a dental office called Dental People Inc.  Within this office, there's 
2 oral surgeons,
 2 orthodontists,
  1 general dentist.

  Both general dentists and oral surgeons can pull teeth. 
  
  Orthodontists cannot pull teeth.  Orthodontists straighten teeth.

  All of these aforementioned specialties are dentists. 
  All dentists graduated from dental school.  
  Oral surgeons place implants.
  General dentists fill teeth

=end

module PullTeeth
  def pull_teeth
    "pull the teeth"
  end
end

class Dentist
  def initialize
    @graduated = true
  end
end

class GeneralDentist < Dentist
  include PullTeeth

  def fill_teeth
    "fill some teeth"
  end
end

class OralSurgeons < Dentist
  include PullTeeth
  
  def place_implant
    "place implant"
  end
end

class Orthodontists < Dentist
  def straighten_teeth
    "straighten the teeth"
  end
end

