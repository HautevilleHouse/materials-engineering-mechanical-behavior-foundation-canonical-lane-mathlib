import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure PhaseDiagramPackage where
  componentList : Type u
  phaseBoundary : Type v
  gibbsEnergyModel : Prop
  equilibriumConditions : Prop
  phaseIdentification : Prop
  componentListTerm : componentList
  phaseBoundaryTerm : phaseBoundary
  gibbsEnergyModelTerm : gibbsEnergyModel
  equilibriumConditionsTerm : equilibriumConditions
  phaseIdentificationTerm : phaseIdentification

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  gibbsEnergyModelClosed : P.gibbsEnergyModel
  equilibriumConditionsClosed : P.equilibriumConditions
  phaseIdentificationClosed : P.phaseIdentification

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.gibbsEnergyModel ∧ P.equilibriumConditions ∧ P.phaseIdentification

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.gibbsEnergyModelClosed (And.intro E.equilibriumConditionsClosed E.phaseIdentificationClosed)

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse
