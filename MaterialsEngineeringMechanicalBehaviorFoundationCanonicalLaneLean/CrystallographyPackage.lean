import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean

structure CrystallographyPackage where
  bravaisLattice : Type u
  unitCell : Type v
  symmetryGroup : Type w
  spaceGroup : Prop
  latticeParameters : Prop
  atomicPositions : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  bravaisLatticeClosed : C.bravaisLattice
  unitCellClosed : C.unitCell
  symmetryGroupClosed : C.symmetryGroup
  spaceGroupClosed : C.spaceGroup
  latticeParametersClosed : C.latticeParameters
  atomicPositionsClosed : C.atomicPositions

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.bravaisLattice ∧ C.unitCell ∧ C.symmetryGroup ∧
  C.spaceGroup ∧ C.latticeParameters ∧ C.atomicPositions

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.bravaisLatticeClosed
    (And.intro E.unitCellClosed
      (And.intro E.symmetryGroupClosed
        (And.intro E.spaceGroupClosed
          (And.intro E.latticeParametersClosed E.atomicPositionsClosed))))

end MaterialsEngineeringMechanicalBehaviorFoundationCanonicalLaneLean
end HautevilleHouse