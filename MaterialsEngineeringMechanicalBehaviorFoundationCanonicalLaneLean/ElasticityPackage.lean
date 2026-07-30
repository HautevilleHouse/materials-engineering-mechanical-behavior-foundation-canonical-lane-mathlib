import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure ElasticityPackage where
  stressTensor : Type u
  strainTensor : Type v
  constitutiveLaw : Prop
  hookesLaw : Prop
  elasticModuli : Prop
  boundaryValueProblem : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  stressTensorClosed : E.stressTensor
  strainTensorClosed : E.strainTensor
  constitutiveLawClosed : E.constitutiveLaw
  hookesLawClosed : E.hookesLaw
  elasticModuliClosed : E.elasticModuli
  boundaryValueProblemClosed : E.boundaryValueProblem

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.stressTensor ∧ E.strainTensor ∧ E.constitutiveLaw ∧
  E.hookesLaw ∧ E.elasticModuli ∧ E.boundaryValueProblem

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.stressTensorClosed
    (And.intro Ev.strainTensorClosed
      (And.intro Ev.constitutiveLawClosed
        (And.intro Ev.hookesLawClosed
          (And.intro Ev.elasticModuliClosed Ev.boundaryValueProblemClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse