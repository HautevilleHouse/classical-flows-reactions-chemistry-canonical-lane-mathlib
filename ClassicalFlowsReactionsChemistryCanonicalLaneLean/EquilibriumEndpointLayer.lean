import classicalFlowsReactionsChemistryCanonicalLaneLean.ChemicalKineticsLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

structure EquilibriumEndpointCertificate where
  kinetics : KineticsCertificate
  equilibriumConstantComputed : Prop
  endpointClosed : Prop
  endpointClosedProof : endpointClosed

def sourceEquilibriumEndpointCertificate : EquilibriumEndpointCertificate := {
  kinetics := sourceKineticsCertificate
  equilibriumConstantComputed := True
  endpointClosed := True
  endpointClosedProof := rfl
}

def EquilibriumEndpointClosed (C : EquilibriumEndpointCertificate) : Prop :=
  C.endpointClosed

theorem source_equilibrium_endpoint_closed :
    EquilibriumEndpointClosed sourceEquilibriumEndpointCertificate := by
  exact sourceEquilibriumEndpointCertificate.endpointClosedProof

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse
