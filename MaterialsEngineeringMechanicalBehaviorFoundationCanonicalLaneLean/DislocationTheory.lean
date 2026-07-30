import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure DislocationGeometry where
  burgersVector : Type
  lineDirection : Type
  slipPlane : Type
  edgeComponent : Prop
  screwComponent : Prop
  mixedComponent : Prop

structure DislocationBehavior where
  peierlsStress : Prop
  dislocationMobility : Prop
  glideClimbMechanisms : Prop
  dislocationInteractions : Prop

structure DislocationTheoryPackage where
  geometry : DislocationGeometry
  behavior : DislocationBehavior
  taylorEquation : Prop
  hardeningModel : Prop
  creepModel : Prop

structure DislocationTheoryEvidence (D : DislocationTheoryPackage) where
  edgeComponentClosed : D.geometry.edgeComponent
  screwComponentClosed : D.geometry.screwComponent
  mixedComponentClosed : D.geometry.mixedComponent
  peierlsStressClosed : D.behavior.peierlsStress
  dislocationMobilityClosed : D.behavior.dislocationMobility
  glideClimbMechanismsClosed : D.behavior.glideClimbMechanisms
  dislocationInteractionsClosed : D.behavior.dislocationInteractions
  taylorEquationClosed : D.taylorEquation
  hardeningModelClosed : D.hardeningModel
  creepModelClosed : D.creepModel

def DislocationTheoryClosed (D : DislocationTheoryPackage) : Prop :=
  D.geometry.edgeComponent ∧ D.geometry.screwComponent ∧
  D.geometry.mixedComponent ∧ D.behavior.peierlsStress ∧
  D.behavior.dislocationMobility ∧ D.behavior.glideClimbMechanisms ∧
  D.behavior.dislocationInteractions ∧ D.taylorEquation ∧
  D.hardeningModel ∧ D.creepModel

theorem dislocation_theory_closed_from_evidence (D : DislocationTheoryPackage) (E : DislocationTheoryEvidence D) : DislocationTheoryClosed D := by
  exact And.intro E.edgeComponentClosed
    (And.intro E.screwComponentClosed
      (And.intro E.mixedComponentClosed
        (And.intro E.peierlsStressClosed
          (And.intro E.dislocationMobilityClosed
            (And.intro E.glideClimbMechanismsClosed
              (And.intro E.dislocationInteractionsClosed
                (And.intro E.taylorEquationClosed
                  (And.intro E.hardeningModelClosed E.creepModelClosed))))))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse
