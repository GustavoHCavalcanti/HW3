Feature: filter movie list by MPAA ratings
  As a RottenPotatoes user
  So that I can see only the movies suitable for me
  I want to filter the movie list by rating

  Background:
    Given the following movies exist:
      | title             | rating | release_date |
      | Aladdin           | G      | 25-Nov-1992  |
      | The Dark Knight   | PG-13  | 18-Jul-2008  |
      | Amelie            | R      | 25-Apr-2001  |
      | Up                | PG     | 29-May-2009  |
      | The Godfather     | R      | 24-Mar-1972  |
    And I am on the RottenPotatoes home page

  @happy
  Scenario: restrict to movies with 'PG' or 'R' ratings
    When I uncheck the following ratings: G, PG-13
    And I check the following ratings: PG, R
    And I press "Refresh"
    Then I should see "Up"
    And I should see "Amelie"
    And I should see "The Godfather"
    And I should not see "Aladdin"
    And I should not see "The Dark Knight"

  @happy
  Scenario: all ratings selected
    When I check the following ratings: G, PG, PG-13, R
    And I press "Refresh"
    Then I should see all of the movies
