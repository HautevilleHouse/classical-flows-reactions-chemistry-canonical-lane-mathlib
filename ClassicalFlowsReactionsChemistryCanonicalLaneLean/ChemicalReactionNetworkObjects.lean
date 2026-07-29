import classicalFlowsReactionsChemistryCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

abbrev Species := String
abbrev Concentration := Species → ℝ
abbrev RateConstant := ℝ
abbrev Time := ℝ

def zeroConcentration : Concentration := fun _ => 0

structure ReactionNetwork where
  species : List Species
  rateConstants : RateConstant → ℝ
  stoichiometry : List (Species × ℝ)
  reversibility : Bool

def primitiveNetwork : ReactionNetwork := {
  species := ["A", "B", "C"]
  rateConstants := fun _ => 1.0
  stoichiometry := [("A", -1.0), ("B", 1.0)]
  reversibility := false
}

structure ReactionKinetics where
  network : ReactionNetwork
  forwardRate : ℝ
  backwardRate : ℝ
  equilibriumConstant : ℝ
  netRate : ℝ

def primitiveKinetics : ReactionKinetics := {
  network := primitiveNetwork
  forwardRate := 1.0
  backwardRate := 0.5
  equilibriumConstant := 2.0
  netRate := 0.5
}

def LawOfMassAction (k : RateConstant) (concs : Concentration) : Prop :=
  concs "A" * concs "B" = k

def EquilibriumConstant (K : ℝ) (concs : Concentration) : Prop :=
  concs "C" / (concs "A" * concs "B") = K

def DetailedBalance (sys : ReactionKinetics) : Prop :=
  sys.forwardRate / sys.backwardRate = sys.equilibriumConstant

theorem primitive_detailed_balance_checked :
    DetailedBalance primitiveKinetics := by
  unfold DetailedBalance primitiveKinetics
  norm_num

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse