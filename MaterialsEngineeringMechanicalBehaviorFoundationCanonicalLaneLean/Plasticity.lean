import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure PlasticityPackage where
  yieldCriterion : Prop
  plasticFlowRule : Prop
  hardeningModel : Prop
  stressStrainCurve : Prop
  viscoplasticity : Prop
  deformationTheory : Prop

structure PlasticityEvidence (P : PlasticityPackage) where
  yieldCriterionClosed : P.yieldCriterion
  plasticFlowRuleClosed : P.plasticFlowRule
  hardeningModelClosed : P.hardeningModel
  stressStrainCurveClosed : P.stressStrainCurve
  viscoplasticityClosed : P.viscoplasticity
  deformationTheoryClosed : P.deformationTheory

def PlasticityClosed (P : PlasticityPackage) : Prop :=
  P.yieldCriterion ∧ P.plasticFlowRule ∧ P.hardeningModel ∧ P.stressStrainCurve ∧ P.viscoplasticity ∧ P.deformationTheory

theorem plasticity_closed_from_evidence (P : PlasticityPackage) (E : PlasticityEvidence P) :
    PlasticityClosed P := by
  exact And.intro E.yieldCriterionClosed
    (And.intro E.plasticFlowRuleClosed
      (And.intro E.hardeningModelClosed
        (And.intro E.stressStrainCurveClosed
          (And.intro E.viscoplasticityClosed E.deformationTheoryClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse