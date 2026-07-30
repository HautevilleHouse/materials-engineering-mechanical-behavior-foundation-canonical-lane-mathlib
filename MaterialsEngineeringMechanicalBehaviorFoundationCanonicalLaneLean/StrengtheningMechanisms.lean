import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure StrengtheningMechanismsPackage where
  solidSolutionHardening : Prop
  precipitationHardening : Prop
  grainBoundaryHardening : Prop
  workHardening : Prop
  transformationHardening : Prop

structure StrengtheningMechanismsEvidence (S : StrengtheningMechanismsPackage) where
  solidSolutionHardeningClosed : S.solidSolutionHardening
  precipitationHardeningClosed : S.precipitationHardening
  grainBoundaryHardeningClosed : S.grainBoundaryHardening
  workHardeningClosed : S.workHardening
  transformationHardeningClosed : S.transformationHardening

def StrengtheningMechanismsClosed (S : StrengtheningMechanismsPackage) : Prop :=
  S.solidSolutionHardening ∧ S.precipitationHardening ∧ S.grainBoundaryHardening ∧ S.workHardening ∧ S.transformationHardening

theorem strengthening_mechanisms_closed_from_evidence (S : StrengtheningMechanismsPackage) (E : StrengtheningMechanismsEvidence S) : StrengtheningMechanismsClosed S := by
  exact And.intro E.solidSolutionHardeningClosed (And.intro E.precipitationHardeningClosed (And.intro E.grainBoundaryHardeningClosed (And.intro E.workHardeningClosed E.transformationHardeningClosed)))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse