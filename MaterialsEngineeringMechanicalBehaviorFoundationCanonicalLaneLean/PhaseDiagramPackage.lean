import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  components : Type u
  phases : Type v
  phaseBoundaries : Prop
  gibbsFreeEnergy : Prop
  leverRule : Prop
  phaseTransformation : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  componentsClosed : P.components
  phasesClosed : P.phases
  phaseBoundariesClosed : P.phaseBoundaries
  gibbsFreeEnergyClosed : P.gibbsFreeEnergy
  leverRuleClosed : P.leverRule
  phaseTransformationClosed : P.phaseTransformation

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.components ∧ P.phases ∧ P.phaseBoundaries ∧
  P.gibbsFreeEnergy ∧ P.leverRule ∧ P.phaseTransformation

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.componentsClosed
    (And.intro E.phasesClosed
      (And.intro E.phaseBoundariesClosed
        (And.intro E.gibbsFreeEnergyClosed
          (And.intro E.leverRuleClosed E.phaseTransformationClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse