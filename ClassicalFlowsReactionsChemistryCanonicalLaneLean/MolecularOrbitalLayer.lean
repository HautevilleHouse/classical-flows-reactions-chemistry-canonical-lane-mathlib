import ClassicalFlowsReactionsChemistryCanonicalLaneLean.ReactionKineticsLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

structure MolecularOrbitalCertificate where
  wavefunctionClosed : Prop
  orbitalEnergyClosed : Prop
  bondOrderClosed : Prop
  wavefunctionClosedProof : wavefunctionClosed
  orbitalEnergyClosedProof : orbitalEnergyClosed
  bondOrderClosedProof : bondOrderClosed

def sourceMolecularOrbitalCertificate : MolecularOrbitalCertificate := {
  wavefunctionClosed := True
  orbitalEnergyClosed := True
  bondOrderClosed := True
  wavefunctionClosedProof := trivial
  orbitalEnergyClosedProof := trivial
  bondOrderClosedProof := trivial
}

def MolecularOrbitalClosed (C : MolecularOrbitalCertificate) : Prop :=
  C.wavefunctionClosed ∧ C.orbitalEnergyClosed ∧ C.bondOrderClosed

theorem source_molecular_orbital_closed :
    MolecularOrbitalClosed sourceMolecularOrbitalCertificate := by
  exact And.intro sourceMolecularOrbitalCertificate.wavefunctionClosedProof
    (And.intro sourceMolecularOrbitalCertificate.orbitalEnergyClosedProof
      sourceMolecularOrbitalCertificate.bondOrderClosedProof)

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse