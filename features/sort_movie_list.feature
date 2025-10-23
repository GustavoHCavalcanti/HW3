Feature: sort movie list
  As a RottenPotatoes user
  So that I can quickly find movies in a preferred order
  I want to sort the movie list by title or by release date

  Background:
    Given the following movies exist:
      | title           | rating | release_date |
      | Aladdin         | G      | 25-Nov-1992  |
      | The Dark Knight | PG-13  | 18-Jul-2008  |
      | Amelie          | R      | 25-Apr-2001  |
      | Up              | PG     | 29-May-2009  |
      | The Godfather   | R      | 24-Mar-1972  |
    And I am on the RottenPotatoes home page

  @happy
  Scenario: sort movies alphabetically
    When I follow "Title"
    Then I should see "Aladdin" before "Amelie"
    And I should see "Amelie" before "The Dark Knight"
    And I should see "The Dark Knight" before "The Godfather"
    And I should see "The Godfather" before "Up"

  @happy
  Scenario: sort movies in increasing order of release date
    When I follow "Release Date"
    Then I should see "The Godfather" before "Aladdin"
    And I should see "Aladdin" before "Amelie"
    And I should see "Amelie" before "The Dark Knight"
    And I should see "The Dark Knight" before "Up"
