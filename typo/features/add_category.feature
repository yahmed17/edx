Feature: AddEdit Categories
  As a blog administrator
  In order to group my blogs
  I want to be able to create catergories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add new category
    When I follow "Categories"
    Then I should be on the new category page
    When I fill in "category_name" with "Sports"
    When I fill in "category_keywords" with "NFL"
    When I press "Save"
    Then I should be on the new category page
    And I should see "Category was successfully saved."
