import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure FatiguePackage where
  stressCycle : Type u
  snCurve : Prop
  enduranceLimit : Prop
  crackInitiation : Prop
  crackPropagation : Prop
  cumulativeDamage : Prop

structure FatigueEvidence (F : FatiguePackage) where
  stressCycleClosed : F.stressCycle
  snCurveClosed : F.snCurve
  enduranceLimitClosed : F.enduranceLimit
  crackInitiationClosed : F.crackInitiation
  crackPropagationClosed : F.crackPropagation
  cumulativeDamageClosed : F.cumulativeDamage

def FatigueClosed (F : FatiguePackage) : Prop :=
  F.stressCycle ∧ F.snCurve ∧ F.enduranceLimit ∧
  F.crackInitiation ∧ F.crackPropagation ∧ F.cumulativeDamage

theorem fatigue_closed_from_evidence (F : FatiguePackage)
    (E : FatigueEvidence F) : FatigueClosed F := by
  exact And.intro E.stressCycleClosed
    (And.intro E.snCurveClosed
      (And.intro E.enduranceLimitClosed
        (And.intro E.crackInitiationClosed
          (And.intro E.crackPropagationClosed E.cumulativeDamageClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse