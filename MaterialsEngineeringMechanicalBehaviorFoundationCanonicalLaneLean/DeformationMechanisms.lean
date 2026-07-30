import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure DeformationMechanismsPackage where
  dislocationMotion : Prop
  twinningActivation : Prop
  creepMechanism : Prop
  shearbanding : Prop
  diffusionFlow : Prop

structure DeformationMechanismsEvidence (D : DeformationMechanismsPackage) where
  dislocationMotionClosed : D.dislocationMotion
  twinningActivationClosed : D.twinningActivation
  creepMechanismClosed : D.creepMechanism
  shearbandingClosed : D.shearbanding
  diffusionFlowClosed : D.diffusionFlow

def DeformationMechanismsClosed (D : DeformationMechanismsPackage) : Prop :=
  D.dislocationMotion ∧ D.twinningActivation ∧ D.creepMechanism ∧ D.shearbanding ∧ D.diffusionFlow

theorem deformation_mechanisms_closed_from_evidence (D : DeformationMechanismsPackage) (E : DeformationMechanismsEvidence D) : DeformationMechanismsClosed D := by
  exact And.intro E.dislocationMotionClosed (And.intro E.twinningActivationClosed (And.intro E.creepMechanismClosed (And.intro E.shearbandingClosed E.diffusionFlowClosed)))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse