-- VectorCAST 6.1a (03/21/13)
-- Test Case Script
-- 
-- Environment    : TUTORIAL
-- Unit(s) Under Test: database manager
-- 
-- Script Features
TEST.SCRIPT_FEATURE:C_DIRECT_ARRAY_INDEXING
TEST.SCRIPT_FEATURE:CPP_CLASS_OBJECT_REVISION
TEST.SCRIPT_FEATURE:MULTIPLE_UUT_SUPPORT
TEST.SCRIPT_FEATURE:MIXED_CASE_NAMES
--

-- Unit: database

-- Subprogram: Get_Table_Record

-- Test Case: Get_Table_Record.001
TEST.UNIT:database
TEST.SUBPROGRAM:Get_Table_Record
TEST.NEW
TEST.NAME:Get_Table_Record.001
TEST.VALUE:database.<<GLOBAL>>.Table_Data[0].Is_Occupied:v_false
TEST.VALUE:database.Get_Table_Record.Table:0
TEST.EXPECTED:database.Get_Table_Record.return.Is_Occupied:v_true
TEST.END

-- Test Case: Get_Table_Record.002
TEST.UNIT:database
TEST.SUBPROGRAM:Get_Table_Record
TEST.NEW
TEST.NAME:Get_Table_Record.002
TEST.BASIS_PATH:1 of 1
TEST.NOTES:
   No branches in subprogram
TEST.END_NOTES:
TEST.VALUE:database.Get_Table_Record.Table:<<MIN>>
TEST.END

-- Subprogram: Update_Table_Record

-- Test Case: Update_Table_Record.001
TEST.UNIT:database
TEST.SUBPROGRAM:Update_Table_Record
TEST.NEW
TEST.NAME:Update_Table_Record.001
TEST.BASIS_PATH:1 of 1
TEST.NOTES:
   No branches in subprogram
TEST.END_NOTES:
TEST.VALUE:database.Update_Table_Record.Table:<<MIN>>
TEST.END

-- Unit: manager

-- Subprogram: Add_Included_Dessert

-- Test Case: Add_Included_Dessert.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Included_Dessert
TEST.NEW
TEST.NAME:Add_Included_Dessert.001
TEST.BASIS_PATH:1 of 3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
      (1) if (((Order->Entree == (STEAK)) && (Order->Salad == (CAESAR))) && (Order->Beverage == (MIXED_DRINK))) ==> FALSE
      (2) if (((Order->Entree == (LOBSTER)) && (Order->Salad == (GREEN))) && (Order->Beverage == (WINE))) ==> FALSE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Add_Included_Dessert.Order:<<malloc 1>>
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Entree:NO_ENTREE
TEST.END

-- Test Case: Add_Included_Dessert.002
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Included_Dessert
TEST.NEW
TEST.NAME:Add_Included_Dessert.002
TEST.BASIS_PATH:2 of 3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
      (1) if (((Order->Entree == (STEAK)) && (Order->Salad == (CAESAR))) && (Order->Beverage == (MIXED_DRINK))) ==> FALSE
      (2) if (((Order->Entree == (LOBSTER)) && (Order->Salad == (GREEN))) && (Order->Beverage == (WINE))) ==> TRUE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Add_Included_Dessert.Order:<<malloc 1>>
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Salad:GREEN
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Entree:LOBSTER
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Beverage:WINE
TEST.END

-- Test Case: Add_Included_Dessert.003
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Included_Dessert
TEST.NEW
TEST.NAME:Add_Included_Dessert.003
TEST.BASIS_PATH:3 of 3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
      (1) if (((Order->Entree == (STEAK)) && (Order->Salad == (CAESAR))) && (Order->Beverage == (MIXED_DRINK))) ==> TRUE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Add_Included_Dessert.Order:<<malloc 1>>
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Salad:CAESAR
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Entree:STEAK
TEST.VALUE:manager.Add_Included_Dessert.Order[0].Beverage:MIXED_DRINK
TEST.END

-- Subprogram: Add_Party_To_Waiting_List

-- Test Case: Add_Party_To_Waiting_List.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Party_To_Waiting_List
TEST.NEW
TEST.NAME:Add_Party_To_Waiting_List.001
TEST.BASIS_PATH:1 of 3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
      (1) if (WaitingListSize > (9)) ==> FALSE
      (2) while (Name && (*Name)) ==> FALSE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.<<GLOBAL>>.WaitingListSize:<<MIN>>
TEST.VALUE:manager.Add_Party_To_Waiting_List.Name:<<malloc 1>>
TEST.VALUE:manager.Add_Party_To_Waiting_List.Name:<<null>>
TEST.END

-- Test Case: Add_Party_To_Waiting_List.002
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Party_To_Waiting_List
TEST.NEW
TEST.NAME:Add_Party_To_Waiting_List.002
TEST.BASIS_PATH:2 of 3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
      (1) if (WaitingListSize > (9)) ==> FALSE
      (2) while (Name && (*Name)) ==> TRUE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.<<GLOBAL>>.WaitingListSize:<<MIN>>
TEST.VALUE:manager.Add_Party_To_Waiting_List.Name:<<malloc 1>>
TEST.VALUE:manager.Add_Party_To_Waiting_List.Name[0]:<<MIN>>
TEST.END

-- Test Case: Add_Party_To_Waiting_List.003
TEST.UNIT:manager
TEST.SUBPROGRAM:Add_Party_To_Waiting_List
TEST.NEW
TEST.NAME:Add_Party_To_Waiting_List.003
TEST.BASIS_PATH:3 of 3
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
      (1) if (WaitingListSize > (9)) ==> TRUE
      (2) while (Name && (*Name)) ==> FALSE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.<<GLOBAL>>.WaitingListSize:<<MAX>>
TEST.VALUE:manager.Add_Party_To_Waiting_List.Name:<<malloc 1>>
TEST.VALUE:manager.Add_Party_To_Waiting_List.Name:<<null>>
TEST.END

-- Subprogram: Clear_Table

-- Test Case: Clear_Table.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Clear_Table
TEST.NEW
TEST.NAME:Clear_Table.001
TEST.BASIS_PATH:1 of 2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
      (1) for (Seat < 4) ==> FALSE
   Test Case Generation Notes:
      Conflict: Unable to validate expression-to-expression comparison in branch 1
TEST.END_NOTES:
TEST.VALUE:manager.Clear_Table.Table:<<MIN>>
TEST.END

-- Test Case: Clear_Table.002
TEST.UNIT:manager
TEST.SUBPROGRAM:Clear_Table
TEST.NEW
TEST.NAME:Clear_Table.002
TEST.BASIS_PATH:2 of 2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
      (1) for (Seat < 4) ==> TRUE
   Test Case Generation Notes:
      Conflict: Unable to validate expression-to-expression comparison in branch 1
TEST.END_NOTES:
TEST.VALUE:manager.Clear_Table.Table:<<MIN>>
TEST.END

-- Subprogram: Get_Check_Total

-- Test Case: Get_Check_Total.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Get_Check_Total
TEST.NEW
TEST.NAME:Get_Check_Total.001
TEST.BASIS_PATH:1 of 1
TEST.NOTES:
   No branches in subprogram
TEST.END_NOTES:
TEST.VALUE:manager.Get_Check_Total.Table:<<MIN>>
TEST.END

-- Subprogram: Get_Next_Party_To_Be_Seated

-- Test Case: Get_Next_Party_To_Be_Seated.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Get_Next_Party_To_Be_Seated
TEST.NEW
TEST.NAME:Get_Next_Party_To_Be_Seated.001
TEST.BASIS_PATH:1 of 2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
      (1) if (WaitingListIndex > (9)) ==> FALSE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.<<GLOBAL>>.WaitingListIndex:<<MIN>>
TEST.END

-- Test Case: Get_Next_Party_To_Be_Seated.002
TEST.UNIT:manager
TEST.SUBPROGRAM:Get_Next_Party_To_Be_Seated
TEST.NEW
TEST.NAME:Get_Next_Party_To_Be_Seated.002
TEST.BASIS_PATH:2 of 2
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
      (1) if (WaitingListIndex > (9)) ==> TRUE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.<<GLOBAL>>.WaitingListIndex:<<MAX>>
TEST.END

-- Subprogram: Place_Order

-- Test Case: Place_Order.001
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.001
TEST.VALUE:manager.Place_Order.Table:1
TEST.VALUE:manager.Place_Order.Seat:1
TEST.VALUE:manager.Place_Order.Order.Soup:ONION
TEST.VALUE:manager.Place_Order.Order.Salad:NO_SALAD
TEST.VALUE:manager.Place_Order.Order.Entree:STEAK
TEST.VALUE:manager.Place_Order.Order.Dessert:CAKE
TEST.VALUE:manager.Place_Order.Order.Beverage:MIXED_DRINK
TEST.VALUE:manager.Place_Order.return:1
TEST.EXPECTED:manager.Place_Order.return:1
TEST.END

-- Test Case: Place_Order.002
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.002
TEST.VALUE:manager.Place_Order.Order.Entree:CHICKEN
TEST.EXPECTED:manager.Place_Order.return:0
TEST.END

-- Test Case: Place_Order.003
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.003
TEST.BASIS_PATH:1 of 5
TEST.NOTES:
This is an automatically generated test case.
   Test Path 1
      (5) case (Order.Entree) ==> PASTA
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Place_Order.Table:<<MIN>>
TEST.VALUE:manager.Place_Order.Seat:<<MIN>>
TEST.VALUE:manager.Place_Order.Order.Entree:PASTA
TEST.END

-- Test Case: Place_Order.004
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.004
TEST.BASIS_PATH:2 of 5
TEST.NOTES:
This is an automatically generated test case.
   Test Path 2
      (1) case (Order.Entree) ==> NO_ENTREE
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Place_Order.Table:<<MIN>>
TEST.VALUE:manager.Place_Order.Seat:<<MIN>>
TEST.VALUE:manager.Place_Order.Order.Entree:NO_ENTREE
TEST.END

-- Test Case: Place_Order.005
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.005
TEST.BASIS_PATH:3 of 5
TEST.NOTES:
This is an automatically generated test case.
   Test Path 3
      (2) case (Order.Entree) ==> STEAK
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Place_Order.Table:<<MIN>>
TEST.VALUE:manager.Place_Order.Seat:<<MIN>>
TEST.VALUE:manager.Place_Order.Order.Entree:STEAK
TEST.END

-- Test Case: Place_Order.006
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.006
TEST.BASIS_PATH:4 of 5
TEST.NOTES:
This is an automatically generated test case.
   Test Path 4
      (3) case (Order.Entree) ==> CHICKEN
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Place_Order.Table:<<MIN>>
TEST.VALUE:manager.Place_Order.Seat:<<MIN>>
TEST.VALUE:manager.Place_Order.Order.Entree:CHICKEN
TEST.END

-- Test Case: Place_Order.007
TEST.UNIT:manager
TEST.SUBPROGRAM:Place_Order
TEST.NEW
TEST.NAME:Place_Order.007
TEST.BASIS_PATH:5 of 5
TEST.NOTES:
This is an automatically generated test case.
   Test Path 5
      (4) case (Order.Entree) ==> LOBSTER
   Test Case Generation Notes:
TEST.END_NOTES:
TEST.VALUE:manager.Place_Order.Table:<<MIN>>
TEST.VALUE:manager.Place_Order.Seat:<<MIN>>
TEST.VALUE:manager.Place_Order.Order.Entree:LOBSTER
TEST.END
