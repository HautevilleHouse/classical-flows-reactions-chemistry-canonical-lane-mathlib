import canonicalLaneMathlib.AdmissibleClass
import ClassicalFlowsReactionsChemistryCanonicalLaneLean.ThermodynamicEquilibriumLayer
import ClassicalFlowsReactionsChemistryCanonicalLaneLean.MolecularOrbitalLayer
import ClassicalFlowsReactionsChemistryCanonicalLaneLean.ReactionKineticsLayer

/-!
# Chemical Admissible Class

This module bundles the three layers (thermodynamics, molecular orbitals, reaction kinetics)
into an AdmissibleClass for the chemistry domain.
-/

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

structure ChemistryObject where
  thermo : ThermodynamicEquilibriumCertificate
  orbital : MolecularOrbitalCertificate
  kinetics : ReactionKineticsCertificate

def chemistryObject : ChemistryObject :=
  { thermo := sourceThermodynamicEquilibriumCertificate,
    orbital := sourceMolecularOrbitalCertificate,
    kinetics := sourceReactionKineticsCertificate }

def chemicalAdmittedObject : AdmittedTheoremObject :=
  { object := { sourceKey := "repositoryKey", theoremObject := "Classical Flows Reactions Chemistry" },
    localWitness := "Chemistry certificate layers",
    bridgeEvidence := "source-derived Lean certificate fields",
    sourceKeyChecked := rfl,
    theoremObjectChecked := rfl
  }

def chemicalAdmissibleClass : AdmissibleClass :=
  { object := chemicalAdmittedObject,
    endpointSatisfied := ThermodynamicEquilibriumClosed sourceThermodynamicEquilibriumCertificate ∧
                         MolecularOrbitalClosed sourceMolecularOrbitalCertificate ∧
                         ReactionKineticsClosed sourceReactionKineticsCertificate,
    remainderRecorded := False,
    gateWitness := Or.inl (by
      apply And.intro source_thermodynamic_equilibrium_closed
      apply And.intro source_molecular_orbital_closed
      exact source_reaction_kinetics_closed)
  }

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse