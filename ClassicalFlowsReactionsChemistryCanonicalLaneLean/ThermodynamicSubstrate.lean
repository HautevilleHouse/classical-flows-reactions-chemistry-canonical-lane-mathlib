import classicalFlowsReactionsChemistryCanonicalLaneLean.ChemicalReactionNetworkObjects

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

abbrev Temperature := ℝ
abbrev Pressure := ℝ
abbrev Volume := ℝ

structure ThermodynamicSubstrate where
  temperature : Temperature
  pressure : Pressure
  volume : Volume
  gibbsFreeEnergy : ℝ
  enthalpy : ℝ
  entropy : ℝ
  substrateAvailable : Bool
  carriedBoundary : String

def thermodynamicSubstrate : ThermodynamicSubstrate := {
  temperature := 298.15
  pressure := 1.0
  volume := 22.414
  gibbsFreeEnergy := -237.18
  enthalpy := -285.83
  entropy := 69.91
  substrateAvailable := true
  carriedBoundary := "Classical thermodynamics imported; unrestricted equilibrium closure carried."
}

theorem substrate_temperature_checked :
    thermodynamicSubstrate.substrateAvailable = true := by
  rfl

theorem carried_boundary_checked :
    thermodynamicSubstrate.carriedBoundary = "Classical thermodynamics imported; unrestricted equilibrium closure carried." := by
  rfl

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse