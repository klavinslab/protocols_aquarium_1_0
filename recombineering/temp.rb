class Protocol
  def debug
    true
  end
  def main
    itms = find(:item, sample: {object_type: "250 mL Baffled Flask"})
    foo = itms.map {|e| e.id}
    show {
      title "Hello World!"
      note "#{foo}"
    }
  end
end