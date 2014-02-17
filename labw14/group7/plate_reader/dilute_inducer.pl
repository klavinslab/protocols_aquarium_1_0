argument
  inducer_abr: string, "The inducer to dilute: choose 'aTc' for tetracycline, or 'lac' for lactose."
  conc: number, "The desired concentration, in ng/ml"
  vol: number, "The desired volume of dilute solution in mL"
end

step
  description:
    "This protocol prepares the glucose media and aTc inducer solutions."
end

if inducer_abr == "aTc"
  take
    #inducer = 1 "Name of aTc inducer in Aquarium Inventory"
  end
end
#should be elseif, but I could not make syntax work...

if inducer_abr == "lac"
  take
    #inducer = 1 "Name of lac inducer in Aquarium Inventory"
  end
end
# need an else clause here in case they do not pick either option... should abort

take
  water = 1 "Molecular Biology Grade Water" #1000mL STERILE
  #tubes = n "1.5ml tubes"
end

initial_conc = 1000 #ng/ml
dilution = intitial_conc / conc

if dilution <= 10
  inducer_vol = vol * 1000 / dilution #uL
  water_vol = vol * 1000 - inducer_vol
  step
    description: "Prepare the aTc inducer"
    check: "Add %{water_vol} uL of MG water to a 1.5mL tube"
    check: "Add %{inducer_vol} uL of %{inducer_abr) stock to the 1.5mL tube"
    check: "Vortex to mix"
  end
end

#construct a while loop for serial dilution, so that no single dilution is more than 10x
#Ex: 1000ng/ml starting stock, dilute first to 100ng/ml, then 10ng/ml, then target
#in this case, we want target 200ng/ml, but we don't know the initial concentration...

#produce
#t = 1 "<<aTc Inducer Tube>>" from atc_tube[]
#location: "Freezer?" #todo: determine whether aTc must be refridgerated
#end

release concat(inducer, water) #todo: I think this is the wrong syntax. Fix if borken.

#log
#  return: { glucose_media: s[:id], aTc_inducer: t[:id]}
#end
