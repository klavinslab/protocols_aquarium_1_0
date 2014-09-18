needs "aqualib/lib/standard"
class Protocol
  include Standard
  def debug
    true
  end
  def main
    flasks = choose_object("250 mL Baffled Flask", take:false) {
      title "Take 3 flask(s)"
    }
  end
end