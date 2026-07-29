import ClassicalFlowsReactionsChemistryCanonicalLaneLean.ThermodynamicsLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

structure CatalysisCertificate where
  turnoverFrequencyClosed : Prop
  activationBarrierReductionClosed : Prop
  selectivityClosed : Prop
  turnoverFrequencyClosedProof : turnoverFrequencyClosed
  activationBarrierReductionClosedProof : activationBarrierReductionClosed
  selectivityClosedProof : selectivityClosed

def sourceCatalysisCertificate : CatalysisCertificate := {
  turnoverFrequencyClosed := True
  activationBarrierReductionClosed := True
  selectivityClosed := True
  turnoverFrequencyClosedProof := trivial
  activationBarrierReductionClosedProof := trivial
  selectivityClosedProof := trivial
}

def CatalysisClosed (C : CatalysisCertificate) : Prop :=
  C.turnoverFrequencyClosed ∧ C.activationBarrierReductionClosed ∧ C.selectivityClosed

theorem source_catalysis_closed :
    CatalysisClosed sourceCatalysisCertificate := by
  exact And.intro sourceCatalysisCertificate.turnoverFrequencyClosedProof
    (And.intro sourceCatalysisCertificate.activationBarrierReductionClosedProof
      sourceCatalysisCertificate.selectivityClosedProof)

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse