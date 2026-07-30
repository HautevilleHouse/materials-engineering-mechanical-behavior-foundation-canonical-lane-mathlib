import MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : MaterialsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MaterialsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse