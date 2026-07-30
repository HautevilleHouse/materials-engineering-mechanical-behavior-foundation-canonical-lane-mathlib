import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure FractureMechanicsPackage where
  crackGeometry : Type u
  stressIntensityFactor : Type v
  fractureToughness : Prop
  energyReleaseRate : Prop
  parisLaw : Prop
  failureCriterion : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  crackGeometryClosed : F.crackGeometry
  stressIntensityFactorClosed : F.stressIntensityFactor
  fractureToughnessClosed : F.fractureToughness
  energyReleaseRateClosed : F.energyReleaseRate
  parisLawClosed : F.parisLaw
  failureCriterionClosed : F.failureCriterion

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.crackGeometry ∧ F.stressIntensityFactor ∧ F.fractureToughness ∧
  F.energyReleaseRate ∧ F.parisLaw ∧ F.failureCriterion

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.crackGeometryClosed
    (And.intro E.stressIntensityFactorClosed
      (And.intro E.fractureToughnessClosed
        (And.intro E.energyReleaseRateClosed
          (And.intro E.parisLawClosed E.failureCriterionClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse