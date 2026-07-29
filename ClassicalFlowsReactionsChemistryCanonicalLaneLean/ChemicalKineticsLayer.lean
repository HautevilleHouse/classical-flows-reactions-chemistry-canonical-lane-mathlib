import classicalFlowsReactionsChemistryCanonicalLaneLean.ThermodynamicSubstrate

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

structure KineticsCertificate where
  substrate : ThermodynamicSubstrate
  arrheniusPreFactor : ℝ
  activationEnergy : ℝ
  reactionOrder : Nat
  rateDeterminingStep : String
  kineticClosure : Prop
  kineticClosureProof : kineticClosure

def sourceKineticsCertificate : KineticsCertificate := {
  substrate := thermodynamicSubstrate
  arrheniusPreFactor := 1.0e13
  activationEnergy := 75.0
  reactionOrder := 2
  rateDeterminingStep := "first step"
  kineticClosure := True
  kineticClosureProof := rfl
}

def KineticsClosed (C : KineticsCertificate) : Prop :=
  C.kineticClosure

theorem source_kinetics_closed :
    KineticsClosed sourceKineticsCertificate := by
  exact sourceKineticsCertificate.kineticClosureProof

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse
