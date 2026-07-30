import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure DislocationMechanicsPackage where
  dislocationLine : Prop
  burgersVector : Prop
  slipSystem : Prop
  peierlsStress : Prop
  dislocationVelocity : Prop
  strainHardening : Prop

structure DislocationMechanicsEvidence (D : DislocationMechanicsPackage) where
  dislocationLineClosed : D.dislocationLine
  burgersVectorClosed : D.burgersVector
  slipSystemClosed : D.slipSystem
  peierlsStressClosed : D.peierlsStress
  dislocationVelocityClosed : D.dislocationVelocity
  strainHardeningClosed : D.strainHardening

def DislocationMechanicsClosed (D : DislocationMechanicsPackage) : Prop :=
  D.dislocationLine ∧ D.burgersVector ∧ D.slipSystem ∧ D.peierlsStress ∧ D.dislocationVelocity ∧ D.strainHardening

theorem dislocation_mechanics_closed_from_evidence (D : DislocationMechanicsPackage) (E : DislocationMechanicsEvidence D) :
    DislocationMechanicsClosed D := by
  exact And.intro E.dislocationLineClosed
    (And.intro E.burgersVectorClosed
      (And.intro E.slipSystemClosed
        (And.intro E.peierlsStressClosed
          (And.intro E.dislocationVelocityClosed E.strainHardeningClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse