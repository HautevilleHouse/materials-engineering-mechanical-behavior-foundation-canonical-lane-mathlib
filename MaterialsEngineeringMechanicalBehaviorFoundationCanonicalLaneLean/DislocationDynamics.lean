import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure Dislocation where
  burgersVector : Vector ℝ 3
  lineDirection : Vector ℝ 3
  slipPlane : Vector ℝ 3 → ℝ
  coreEnergy : ℝ

structure DislocationDensity where
  density : ℝ
  mobileFraction : ℝ
  meanFreePath : ℝ

def DislocationClosed (D : Dislocation) : Prop :=
  D.coreEnergy > 0 ∧
  D.burgersVector.norm > 0

theorem dislocation_closed_from_evidence (D : Dislocation) (h_energy : D.coreEnergy > 0) (h_burgers : D.burgersVector.norm > 0) : DislocationClosed D :=
  And.intro h_energy h_burgers

structure PlasticDeformationModel where
  dislocationDensity : DislocationDensity
  flowStress : ℝ → ℝ
  strainRate : ℝ → ℝ
  taylorHardening : ℝ

def PlasticDeformationClosed (M : PlasticDeformationModel) : Prop :=
  M.dislocationDensity.density ≥ 0 ∧ M.dislocationDensity.mobileFraction ∈ Set.Icc 0 1 ∧ M.taylorHardening > 0

theorem plastic_deformation_closed_from_evidence (M : PlasticDeformationModel) (h_density : M.dislocationDensity.density ≥ 0) (h_mobile : M.dislocationDensity.mobileFraction ∈ Set.Icc 0 1) (h_hardening : M.taylorHardening > 0) : PlasticDeformationClosed M :=
  And.intro h_density (And.intro h_mobile h_hardening)

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse