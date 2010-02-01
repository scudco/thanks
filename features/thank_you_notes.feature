Feature: In order to process a list of Thank You Notes
The Writer should be able to create new Thank You Notes

Scenario: Creating a new Thank You Note
    Given I am on /notes/new
    When I fill in the following:
      | Address | Allan and Elaine Smithee\n123 Fake St.\nFuntown, CA 94105       |
      | Gift    | Deluxe Slap-chop |
      | Body    | We wanted to thank you so much for the Deluxe Slapchop! It was a great addition to our other slapchops. Now we can slapchop five things at once. It really makes working in our kitchen enjoyable. Love, John and Jane Doe |
      | Sent | |
    And I press "Create Note" 
    Then I should see "Thank You Note successfully saved!"

Scenario: Viewing the list of Thank You Notes
    Given I have created 5 Thank You Notes
    When I go to /notes
    Then I should see 5 notes

Scenario: Viewing sent and unsent Thank You Notes
    Given I have created 3 Sent Thank You Notes
    And I have created 2 Unsent Thank You Notes
    When I go to /notes
    Then I should see 3 sent notes
    And I should see 2 unsent notes

Scenario: Viewing a Thank You Note
    Given I have created 1 Thank You Note
    And I visit that note's page
    Then I should see the Thank You Note
