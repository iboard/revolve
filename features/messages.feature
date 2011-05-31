Feature: Messages
  In order to see messages
  As a user
  I want to list, show, edit, and destroy messages via messages-controller
 
  Background:
    Given the following message records
      | subject             | body                                         |
      | Message in a bottle | The body must be 40 characters long at least |

 
  Scenario: Show messages on the root-path
    Given I am on the home page
    Then I should see "Message in a bottle"
    And I should see "The body must be 40 characters long at least"

  Scenario: I should be able to load the edit message form
    Given I am on the home page
    And I follow "Edit"
    Then I should see "Editing message"

  Scenario: I should be able modify a message
    Given I am on the home page
    And I follow "Edit"
    And I fill in "Body" with "This is the new message and 40 chars long too."
    And I press "Update Message"
    Then I should see "This is the new message and 40 chars long too."
