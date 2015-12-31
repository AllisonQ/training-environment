Feature: JSON register checks

Scenario: DT160760
  Given I have entered a title number DT160760
  When the objects for DT150760 are returned
  Then title number DT1600760 is identified
   And the correct DLR is identied
   And the correct role code for entry 2 is identified
   And the correct UPRNS entry is identified
   And the correct message for the 5th migrator error is idenified
   And the correct infill type for entry 1 is identified
   And the correct district is identified
   And the correct co-ordinates are identified

  Scenario: GR504812
    Given I have entered a title number GR504812
    When the objects for GR504812 are returned
    Then title number GR504812 is identified
    And the correct tenure is indentied
    And the correct entry id for entry 12 is identified
    And the correct application reference is identified
    And the correct extractor for the 1st migrator error is identified
    And the correct sub register for entry 16 is identified
    And the correct edition date is identified
    And the correct status for the first entry is identified

Scenario: MS465614
    Given I have entered a title number MS465614
    When the objects for MS465614 are returned
    Then title number MS465614 is identified
    And the correct DLR is indentified
    And the correct language for entry 5 is identified
    And the correct message number for the 1st migrator error is identified
    And the correct message for the 1st migrator error is identified
    And the correct description for the deed in 9th entry is indentified
    And the correct role code for the 12th entry is displayed
    And the correct type of the map entry within the Geometry entry for the title is displayed

Scenario: BD161882
    Given I have entered a title number BD161882
    When the object for BD161882 is returned
    Then title number BD161882 is indentified
    And the correct class of title is indentified
    And the correct template text for entry 2 is indentified
    And the correct application reference is indentified
    And the correct names of proprietors in entry 7 are indentified
    And the correct sub register for entry 4 is dindentified
    And the correct edition date is indentified
    And the correct status for the 7th entry is indentified

Scenario: BD161870
    Given I have entered the title number BD161870
    When the objects for BD161870 are returned
    Then the title number BD161870 is indentified
    And correct DLR is indentified
    And the correct role code for entry 1 is indentified
    And the correct full text for entry 2 is indentified
    And the correct text for the first infill for entry 3 is indentified
    And the correct postcode for the address of the infill for entry 1 is indentified
    And the correct district is indentified
    And the correct properties in the index/crs entry of the Geometry are indentified
