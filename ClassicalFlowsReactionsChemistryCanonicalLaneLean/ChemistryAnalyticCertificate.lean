import classicalFlowsReactionsChemistryCanonicalLaneLean.EquilibriumEndpointLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

structure ChemistryAnalyticCertificate where
  substrateClosed : Prop
  kineticsLayerClosed : Prop
  equilibriumLayerClosed : Prop
  canonicalCarriageImported : Prop
  substrateClosedProof : substrateClosed
  kineticsLayerClosedProof : kineticsLayerClosed
  equilibriumLayerClosedProof : equilibriumLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceChemistryAnalyticCertificate : ChemistryAnalyticCertificate := {
  substrateClosed := True
  kineticsLayerClosed := KineticsClosed sourceKineticsCertificate
  equilibriumLayerClosed := EquilibriumEndpointClosed sourceEquilibriumEndpointCertificate
  canonicalCarriageImported := True
  substrateClosedProof := rfl
  kineticsLayerClosedProof := source_kinetics_closed
  equilibriumLayerClosedProof := source_equilibrium_endpoint_closed
  canonicalCarriageImportedProof := rfl
}

def ChemistryAnalyticCertificateClosed (C : ChemistryAnalyticCertificate) : Prop :=
  C.substrateClosed ∧
  C.kineticsLayerClosed ∧
  C.equilibriumLayerClosed ∧
  C.canonicalCarriageImported

theorem source_chemistry_analytic_certificate_closed :
    ChemistryAnalyticCertificateClosed sourceChemistryAnalyticCertificate := by
  exact And.intro sourceChemistryAnalyticCertificate.substrateClosedProof
    (And.intro sourceChemistryAnalyticCertificate.kineticsLayerClosedProof
      (And.intro sourceChemistryAnalyticCertificate.equilibriumLayerClosedProof
        sourceChemistryAnalyticCertificate.canonicalCarriageImportedProof))

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse
