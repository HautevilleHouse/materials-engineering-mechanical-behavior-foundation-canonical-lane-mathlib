import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure DislocationPlasticityPackage where
  dislocationDensity : Type u
  slipSystem : Type v
  criticalResolvedShearStress : Prop
  taylorHardening : Prop
  strainRateSensitivity : Prop
  cpfeModel : Prop

structure DislocationPlasticityEvidence (D : DislocationPlasticityPackage) where
  dislocationDensityClosed : D.dislocationDensity
  slipSystemClosed : D.slipSystem
  criticalResolvedShearStressClosed : D.criticalResolvedShearStress
  taylorHardeningClosed : D.taylorHardening
  strainRateSensitivityClosed : D.strainRateSensitivity
  cpfeModelClosed : D.cpfeModel

def DislocationPlasticityClosed (D : DislocationPlasticityPackage) : Prop :=
  D.dislocationDensity ∧ D.slipSystem ∧ D.criticalResolvedShearStress ∧
  D.taylorHardening ∧ D.strainRateSensitivity ∧ D.cpfeModel

theorem dislocation_plasticity_closed_from_evidence (D : DislocationPlasticityPackage)
    (E : DislocationPlasticityEvidence D) : DislocationPlasticityClosed D := by
  exact And.intro E.dislocationDensityClosed
    (And.intro E.slipSystemClosed
      (And.intro E.criticalResolvedShearStressClosed
        (And.intro E.taylorHardeningClosed
          (And.intro E.strainRateSensitivityClosed E.cpfeModelClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse