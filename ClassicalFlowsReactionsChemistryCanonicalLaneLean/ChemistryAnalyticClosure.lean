import ClassicalFlowsReactionsChemistryCanonicalLaneLean.ChemicalEquilibriumLayer
import ClassicalFlowsReactionsChemistryCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

def ChemistryAdmittedAnalyticClosure : Prop :=
  ReactionKineticsClosed sourceReactionKineticsCertificate ∧
  MolecularOrbitalClosed sourceMolecularOrbitalCertificate ∧
  ThermodynamicsClosed sourceThermodynamicsCertificate ∧
  CatalysisClosed sourceCatalysisCertificate ∧
  ChemicalEquilibriumClosed sourceChemicalEquilibriumCertificate ∧
  ConstrainedTheoremClosure chemistryAdmissibleClass

theorem chemistry_admitted_analytic_closure_checked :
    ChemistryAdmittedAnalyticClosure := by
  refine And.intro source_reaction_kinetics_closed
    (And.intro source_molecular_orbital_closed
      (And.intro source_thermodynamics_closed
        (And.intro source_catalysis_closed
          (And.intro source_chemical_equilibrium_closed
            (constrained_theorem_closure chemistryAdmissibleClass)))))

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse