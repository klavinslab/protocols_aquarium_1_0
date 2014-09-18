needs "aqualib/lib/standard"
class Protocol
  include Standard
  def debug
    true
  end
  def main
    nflasks = 3
    flasks = choose_object("250 mL Baffled Flask", take:false) {
      title "Take #{nflasks} flask(s)"
    }
  end
end