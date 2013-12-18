

argument
  lb_liquid_n: number, "Enter the number of LB liquid media bottles to autoclave."
end

argument
  lb_agar_n: number, "Enter the number of LB agar media bottles to autoclave."
end

argument
  tb_liquid_n: number, "Enter the number of TB liquid media bottles to autoclave."
end


# NOTE: as of 20131213, if arguments are left blank these conditionals still work
if lb_liquid_n > 1
  take
    lb_liquid = lb_liquid_n "800 mL LB Liquid (unsterile)"
  end
end
if lb_agar_n > 1
  take
    lb_agar = lb_agar_n "800 mL LB Agar (unsterile)"
  end
end
if tb_liquid_n > 1
  take
    tb_liquid = tb_liquid_n "800 mL TB Liquid (unsterile)"
  end
end


if lb_agar_n > 1
  # Autoclave A1 can't handle agar, so don't use it
  autoclave = "A1"
else
  step
    description: "Select an autoclave"
    getdata
      autoclave: string, "Select which autoclave to use: tabletop autoclave A1 or freestanding autoclave A2.", ["A1", "A2"]
    end
  end
end

# FIXME: finish this protocol
