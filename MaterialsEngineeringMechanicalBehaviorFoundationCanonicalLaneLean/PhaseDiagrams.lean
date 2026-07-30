import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure PhaseDiagramsPackage where
  phaseRule : Prop
  binaryPhaseDiagram : Prop
  ternaryPhaseDiagram : Prop
  freeEnergyCurve : Prop
  leverRule : Prop
  phaseTransformation : Prop

structure PhaseDiagramsEvidence (P : PhaseDiagramsPackage) where
  phaseRuleClosed : P.phaseRule
  binaryPhaseDiagramClosed : P.binaryPhaseDiagram
  ternaryPhaseDiagramClosed : P.ternaryPhaseDiagram
  freeEnergyCurveClosed : P.freeEnergyCurve
  leverRuleClosed : P.leverRule
  phaseTransformationClosed : P.phaseTransformation

def PhaseDiagramsClosed (P : PhaseDiagramsPackage) : Prop :=
  P.phaseRule ∧ P.binaryPhaseDiagram ∧ P.ternaryPhaseDiagram ∧ P.freeEnergyCurve ∧ P.leverRule ∧ P.phaseTransformation

theorem phase_diagrams_closed_from_evidence (P : PhaseDiagramsPackage) (E : PhaseDiagramsEvidence P) :
    PhaseDiagramsClosed P := by
  exact And.intro E.phaseRuleClosed
    (And.intro E.binaryPhaseDiagramClosed
      (And.intro E.ternaryPhaseDiagramClosed
        (And.intro E.freeEnergyCurveClosed
          (And.intro E.leverRuleClosed E.phaseTransformationClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse