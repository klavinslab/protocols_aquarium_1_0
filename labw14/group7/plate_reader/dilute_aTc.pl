#argument
  #inducer_abr: string, "The inducer to dilute: choose 'aTc' for tetracycline, or 'lac' for lactose."
#  conc: number, "The desired concentration, in ng/ml"
#  vol: number, "The desired volume of dilute solution in mL"
#end

target_conc = 200 #"The desired concentration, in ng/ml"
vol = 1 #"The desired volume of dilute solution in mL"
inducer_abr = "aTc"
step
  description:
    "This protocol describes how to prepare 1mL of '200ng/ml aTc' inducer in MG water through serial dilution."
end

#if inducer_abr == "aTc"
# take
# inducer = 1 "Name of aTc inducer in Aquarium Inventory"
# end
#end
#should be elseif, but I could not make syntax work...

#if inducer_abr == "lac"
# take
# inducer = 1 "Name of lac inducer in Aquarium Inventory"
# end
#end
# need an else clause here in case they do not pick either option... should abort

step #This should REALLY be a "take", but this item is not in the Aquarium inventory yet...
  description: "Retrieve the aTc stock"
  check: "Retrive the '100ug/ml aTc stock solution' from location B1.165"
end

initial_conc = 100 #ug/ml
dilution = 1000 * initial_conc / target_conc #500x

dilution_steps = 1 #count how many dilutions steps we need
d = dilution #find the "modulus 10" of the diltion (in thi case, d = 5 at the end of the loop, with 3 steps
while d > 10
  dilutions_steps = dilution_steps + 1
  d = d / 10
end

take
  water = 1 "Molecular Biology Grade Water" #1000mL STERILE
  tubes = dilution_steps "1.5ml tubes" #3 steps
end

conc = 1000 * initial_conc / d # ng per ml of aTc in first dilution
inducer_vol = vol * 1000 / d #uL of aTc stock in first dilution
water_vol = vol * 1000 - inducer_vol #uL of MG water in first dilution

step
  description: "Dilute the aTc inducer in MG water"
  check: "Add %{water_vol} uL of MG water to a 1.5mL tube"
  check: "Add %{inducer_vol} uL of '100ug/ml aTc stock solution' to the 1.5mL tube"
  check: "Vortex to mix"
  check: "Label this tube '%{inducer_abr), %{conc} ng/ml'"
end

#release inducer
step #This should REALLY be a "release", but this item is not in the Aquarium inventory yet...
  description: "Return the aTc stock"
  check: "Return the '100ug/ml aTc stock solution' to location B1.165"
end

#construct a while loop for serial dilution, so that no single dilution is more than 10x
#Ex: 100000ng/ml starting stock, dilute first to 10000ng/ml, then 1000ng/ml, then 200ng/ml (target)
i = 1
df = 10 #dilute by a factor of 10 each round
inducer_vol = vol * 1000 / df #uL of aTc solution from previous step == 100uL
water_vol = vol * 1000 - inducer_vol #uL of MG water == 900uL
next_conc = conc / df #ng per ml of aTc in the next dilution step
while i<dilution_steps
  step
    description: "Further dilute the aTc inducer in MG water"
    check: "Add %{water_vol} uL of MG water to a new 1.5mL tube"
    check: "Add %{inducer_vol} uL of the '%{inducer_abr), %{conc} ng/ml' made in the previous step to the new 1.5mL tube"
    check: "Vortex to mix"
    check: "Label this tube '%{inducer_abr), %{next_conc} ng/ml'"
  end
  conc = conc/df
  next_conc = next_conc/df #itereate the concentrations down by a factor of 10 each round
  i = i+1
end

step
  description: "Store your diluted aTc solution"
  note: "Just keep your %{vol} mL of %{target_conc} aTc solution on the Bench for now"
  note: "You can hang onto the intermediate dilutions for now (in case of mistakes), but you will dispose of them at the end of the day"
end

release water #todo: I think this is the wrong syntax. Fix if borken.





#produce
#t = 1 "<<aTc Inducer Tube>>" from atc_tube[]
#location: "Freezer?" #todo: determine whether aTc must be refridgerated
#end


#log
# return: { glucose_media: s[:id], aTc_inducer: t[:id]}
#end
