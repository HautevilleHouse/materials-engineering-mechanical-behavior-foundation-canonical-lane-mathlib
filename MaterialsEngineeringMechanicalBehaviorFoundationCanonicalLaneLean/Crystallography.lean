import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type u
  pointGroup : Type v
  spaceGroup : Type w
  latticeParameters : Prop
  symmetryOperations : Prop
  bravaisLatticeTerm : bravaisLattice
  pointGroupTerm : pointGroup
  spaceGroupTerm : spaceGroup
  latticeParametersTerm : latticeParameters
  symmetryOperationsTerm : symmetryOperations

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeParametersClosed : C.latticeParameters
  symmetryOperationsClosed : C.symmetryOperations

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeParameters ∧ C.symmetryOperations

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.latticeParametersClosed E.symmetryOperationsClosed

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse
