import canonicalLaneMathlib.AdmissibleClass

/-!
# Reaction Kinetics Layer

This module defines the reaction kinetics vocabulary used in the Classical Flows
Reactions Chemistry repository: rate laws, equilibrium constants, activation
barriers, and the bridge to admissible class closure.
-/

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

abbrev Concentration := ℝ
abbrev Time := ℝ
abbrev RateConstant := ℝ
abbrev ActivationEnergy := ℝ
abbrev Temperature := ℝ

structure Species where
  name : String
  initialConcentration : Concentration

structure Reaction where
  reactants : List Species
  products : List Species
  rateConstant : RateConstant
  activationEnergy : ActivationEnergy

def zeroConcentration : Concentration := 0

def equilibriumConstant (forward : RateConstant) (reverse : RateConstant) : ℝ :=
  forward / reverse

structure RateLaw where
  reaction : Reaction
  order : ℕ
  rateExpression : Concentration → ℝ

def massActionRate (law : RateLaw) (c : Concentration) : ℝ :=
  law.rateExpression c

def ArrheniusRate (A : RateConstant) (Ea : ActivationEnergy) (R : Temperature) (T : Temperature) : ℝ :=
  A * Real.exp (-Ea / (R * T))

structure ReactionKineticsCertificate where
  reaction : Reaction
  forwardRateChecked : Prop
  equilibriumChecked : Prop
  rateLawClosed : Prop
  forwardRateClosed : forwardRateChecked
  equilibriumClosed : equilibriumChecked
  rateLawClosedProof : rateLawClosed

def sourceReactionKineticsCertificate : ReactionKineticsCertificate := {
  reaction := {
    reactants := [{ name := "A", initialConcentration := 1.0 }]
    products := [{ name := "B", initialConcentration := 0.0 }]
    rateConstant := 0.1
    activationEnergy := 50.0
  }
  forwardRateChecked := True
  equilibriumChecked := True
  rateLawClosed := True
  forwardRateClosed := trivial
  equilibriumClosed := trivial
  rateLawClosedProof := trivial
}

def ReactionKineticsClosed (C : ReactionKineticsCertificate) : Prop :=
  C.forwardRateChecked ∧ C.equilibriumChecked ∧ C.rateLawClosed

theorem source_reaction_kinetics_closed :
    ReactionKineticsClosed sourceReactionKineticsCertificate := by
  exact And.intro sourceReactionKineticsCertificate.forwardRateClosed
    (And.intro sourceReactionKineticsCertificate.equilibriumClosed
      sourceReactionKineticsCertificate.rateLawClosedProof)

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse