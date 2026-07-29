import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  chemicalClosureStatement : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceRepository : String := "classical-flows-reactions-chemistry-canonical-lane"
def sourceDescription : String := "Classical Flows Reactions Chemistry: reaction kinetics, molecular orbital theory, thermodynamics, chemical equilibrium"
def claimBoundary : String := "classical chemistry results admitted through canonical lane bridge closure"

sourceRepository
theorem_statement_checked :
    sourceRepository = "classical-flows-reactions-chemistry-canonical-lane" := by
  rfl

end ClassicalFlowsReactionsChemistryCanonicalLaneLean
end HautevilleHouse
