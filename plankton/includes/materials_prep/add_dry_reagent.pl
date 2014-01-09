# Subprotocol for adding a dry reagent to a container - should be standardized
#
# Items the user is expected to have:
#   1. A spatula
#   2. A scale
#   3. The dry reagent being added
#   4. The container the reagent is to be put into
# Inventory effects: none


argument
  container: string, "The vessel to which the reagent is being added."
end
argument
  reagent: string, "The reagent being added."
end
argument
  grams: number, "The mass of reagent to add in grams."
end


# Clean the spatula
include "plankton/includes/materials_prep/clean_spatula.pl"
end


# Add the reagents
step
  description: "Measure and add %{grams} g of %{reagent}"
  note: "Using a scale, weigh out %{grams} g of %{reagent} and add to %{container}.\n\nDo not return any excess to the source bottle."
  image: "pouring_dry_reagent_into_1_L_bottle"
end
