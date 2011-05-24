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
