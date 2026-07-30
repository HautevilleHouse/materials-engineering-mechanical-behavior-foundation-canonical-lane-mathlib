import MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MaterialsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MaterialsAdmittedObject where
  space : MaterialsSpace
  materialBehavior : Prop
  materialStructure : Prop
  modelType : Type
  modelTopology : TopologicalSpace modelType
  mechanicalProperty : Prop
  conclusion : mechanicalProperty

structure MaterialsEndgameState where
  object : MaterialsAdmittedObject

def MaterialsWitnessClosed (O : MaterialsAdmittedObject) : Prop :=
  O.mechanicalProperty

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse