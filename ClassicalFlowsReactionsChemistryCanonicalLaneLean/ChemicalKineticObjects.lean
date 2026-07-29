import canonicalLaneMathlib.AdmissibleClass

/-!
# Chemical Kinetic Objects

This module defines the core analytic objects for classical flows reactions chemistry:
reaction rates, rate constants, concentrations, and elementary step structures.
-/

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

abbrev Time := ℝ
abbrev Concentration := ℝ
abbrev RateConstant := ℝ
abbrev ReactionRate := ℝ

structure ChemicalSpecies where
  name : String
  initialConcentration : Concentration

def zeroConcentration : Concentration := 0

structure ElementaryStep where
  reactants : List ChemicalSpecies
  products : List ChemicalSpecies
  forwardRateConstant : RateConstant
  reverseRateConstant : RateConstant
  stoichiometry : List ℤ  -- stoichiometric coefficients for reactants (negative) and products (positive)

def rateLaw (step : ElementaryStep) (concentrations : ChemicalSpecies → Concentration) : ReactionRate :=
  let forward := step.forwardRateConstant * (step.reactants.map (λ s => concentrations s)).product
  let reverse := step.reverseRateConstant * (step.products.map (λ s => concentrations s)).product
  forward - reverse

structure ReactionNetwork where
  species : List ChemicalSpecies
  steps : List ElementaryStep
  name : String

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse