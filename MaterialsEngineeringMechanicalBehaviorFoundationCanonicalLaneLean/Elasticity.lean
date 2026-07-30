import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure ElasticityPackage where
  linearStressStrain : Type u
  elasticModuli : Type v
  hookesLaw : Prop
  smallDeformation : Prop
  linearStressStrainTerm : linearStressStrain
  elasticModuliTerm : elasticModuli
  hookesLawTerm : hookesLaw
  smallDeformationTerm : smallDeformation

structure ElasticityEvidence (E : ElasticityPackage) where
  hookesLawClosed : E.hookesLaw
  smallDeformationClosed : E.smallDeformation

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.hookesLaw ∧ E.smallDeformation

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.hookesLawClosed Ev.smallDeformationClosed

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse
